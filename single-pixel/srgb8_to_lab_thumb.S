.syntax unified
.arch armv7-a
.fpu neon-vfpv4
.thumb

.text
.align 2

.global rgb8_to_lab_thumb
.type rgb8_to_lab_thumb, %function
.thumb_func

@ void rgb8_to_lab_thumb(uint32_t rgb, float *out_lab)
@
@ rgb:     0x00RRGGBB in r0
@ out_lab: pointer in r1 to three float32 values L*, a*, b*
@
@ Target boundary:
@   - AArch32 / ARMv7-A userland
@   - Thumb-2
@   - VFPv4 available internally
@   - Android/armeabi-v7a softfp calling convention
@
@ The SC9863A phone reports armv7l/armeabi-v7a with Thumb, VFPv4 and NEON.
@ This one-pixel path uses VFP scalar instructions; NEON would matter once
@ we batch many pixels.
rgb8_to_lab_thumb:
    push    {r4-r7, lr}
    vpush   {d8-d11}                @ preserve s16-s23

    mov     r4, r1                  @ output pointer
    ubfx    r5, r0, #16, #8        @ R
    ubfx    r6, r0, #8, #8         @ G
    uxtb    r7, r0                  @ B

    mov     r0, r5
    bl      srgb8_to_linear
    vmov.f32 s16, s0

    mov     r0, r6
    bl      srgb8_to_linear
    vmov.f32 s17, s0

    mov     r0, r7
    bl      srgb8_to_linear
    vmov.f32 s18, s0

    @ Linear sRGB -> XYZ (D65).
    ldr     r0, =m_xr
    vldr    s0, [r0]
    vmul.f32 s19, s16, s0
    ldr     r0, =m_xg
    vldr    s0, [r0]
    vmla.f32 s19, s17, s0
    ldr     r0, =m_xb
    vldr    s0, [r0]
    vmla.f32 s19, s18, s0

    ldr     r0, =m_yr
    vldr    s0, [r0]
    vmul.f32 s20, s16, s0
    ldr     r0, =m_yg
    vldr    s0, [r0]
    vmla.f32 s20, s17, s0
    ldr     r0, =m_yb
    vldr    s0, [r0]
    vmla.f32 s20, s18, s0

    ldr     r0, =m_zr
    vldr    s0, [r0]
    vmul.f32 s21, s16, s0
    ldr     r0, =m_zg
    vldr    s0, [r0]
    vmla.f32 s21, s17, s0
    ldr     r0, =m_zb
    vldr    s0, [r0]
    vmla.f32 s21, s18, s0

    @ Normalize by D65 white: Xn=0.95047, Yn=1, Zn=1.08883.
    ldr     r0, =white_x
    vldr    s0, [r0]
    vdiv.f32 s19, s19, s0
    ldr     r0, =white_z
    vldr    s0, [r0]
    vdiv.f32 s21, s21, s0

    @ f(X/Xn), f(Y/Yn), f(Z/Zn)
    vmov.f32 s0, s19
    bl      lab_f
    vmov.f32 s19, s0

    vmov.f32 s0, s20
    bl      lab_f
    vmov.f32 s20, s0

    vmov.f32 s0, s21
    bl      lab_f
    vmov.f32 s21, s0

    @ L* = 116 fy - 16
    ldr     r0, =c_116
    vldr    s0, [r0]
    vmul.f32 s22, s20, s0
    ldr     r0, =c_16
    vldr    s0, [r0]
    vsub.f32 s22, s22, s0

    @ a* = 500 (fx - fy)
    vsub.f32 s23, s19, s20
    ldr     r0, =c_500
    vldr    s0, [r0]
    vmul.f32 s23, s23, s0

    @ b* = 200 (fy - fz), reuse s19.
    vsub.f32 s19, s20, s21
    ldr     r0, =c_200
    vldr    s0, [r0]
    vmul.f32 s19, s19, s0

    vstr    s22, [r4, #0]
    vstr    s23, [r4, #4]
    vstr    s19, [r4, #8]

    vpop    {d8-d11}
    pop     {r4-r7, pc}

.size rgb8_to_lab_thumb, .-rgb8_to_lab_thumb


.type srgb8_to_linear, %function
.thumb_func
@ r0 = one RGB8 channel (0..255)
@ returns linear-light float32 in s0
@
@ For 8-bit sRGB the standard 0.04045 branch boundary falls between
@ integer codes 10 and 11, so the branch can be done before float math.
srgb8_to_linear:
    push    {r4, lr}
    mov     r4, r0

    vmov    s0, r0
    vcvt.f32.u32 s0, s0
    ldr     r0, =c_255
    vldr    s1, [r0]
    vdiv.f32 s0, s0, s1

    cmp     r4, #10
    bhi     .Lsrgb_power

    ldr     r0, =c_12_92
    vldr    s1, [r0]
    vdiv.f32 s0, s0, s1
    pop     {r4, pc}

.Lsrgb_power:
    ldr     r0, =c_0_055
    vldr    s1, [r0]
    vadd.f32 s0, s0, s1
    ldr     r0, =c_1_055
    vldr    s1, [r0]
    vdiv.f32 s0, s0, s1

    @ Android armeabi-v7a is softfp: float arguments/results cross this
    @ external C boundary in core registers even though VFP is used inside.
    vmov    r0, s0
    ldr     r1, =0x4019999a         @ float32 2.4
    bl      powf
    vmov    s0, r0
    pop     {r4, pc}

.size srgb8_to_linear, .-srgb8_to_linear


.type lab_f, %function
.thumb_func
@ s0 = t >= 0, returns CIELAB f(t) in s0.
@
@ f(t) = cbrt(t)                           if t > (6/29)^3
@        t/(3*(6/29)^2) + 4/29             otherwise
@
@ Cube root uses eight Newton iterations from x0=1:
@ x <- (2x + t/x^2)/3
@ Over the normalized sRGB/D65 range t is in [0,1], and eight steps are
@ ample at the CIELAB branch boundary.
lab_f:
    ldr     r0, =lab_epsilon
    vldr    s1, [r0]
    vcmp.f32 s0, s1
    vmrs    APSR_nzcv, fpscr
    ble     .Llab_linear

    vmov.f32 s1, s0                  @ t
    vmov.f32 s2, #1.0               @ x

    movs    r0, #8
.Lcbrt_loop:
    vmul.f32 s3, s2, s2             @ x^2
    vdiv.f32 s3, s1, s3             @ t/x^2
    vadd.f32 s4, s2, s2             @ 2x
    vadd.f32 s4, s4, s3
    ldr     r1, =c_3
    vldr    s5, [r1]
    vdiv.f32 s2, s4, s5
    subs    r0, r0, #1
    bne     .Lcbrt_loop

    vmov.f32 s0, s2
    bx      lr

.Llab_linear:
    ldr     r0, =lab_linear_scale
    vldr    s1, [r0]
    vmul.f32 s0, s0, s1
    ldr     r0, =lab_linear_offset
    vldr    s1, [r0]
    vadd.f32 s0, s0, s1
    bx      lr

.size lab_f, .-lab_f


.section .rodata
.align 2

@ IEC sRGB inverse transfer constants.
c_255:   .float 255.0
c_12_92: .float 12.92
c_0_055: .float 0.055
c_1_055: .float 1.055

@ Standard sRGB -> XYZ matrix, D65.
m_xr: .float 0.4124564
m_xg: .float 0.3575761
m_xb: .float 0.1804375
m_yr: .float 0.2126729
m_yg: .float 0.7151522
m_yb: .float 0.0721750
m_zr: .float 0.0193339
m_zg: .float 0.1191920
m_zb: .float 0.9503041

white_x: .float 0.95047
white_z: .float 1.08883

@ CIELAB constants.
lab_epsilon:       .float 0.0088564517
lab_linear_scale:  .float 7.7870370370
lab_linear_offset: .float 0.1379310345

c_3:   .float 3.0
c_16:  .float 16.0
c_116: .float 116.0
c_200: .float 200.0
c_500: .float 500.0
