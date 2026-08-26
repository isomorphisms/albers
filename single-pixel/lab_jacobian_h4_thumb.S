.syntax unified
.arch armv7-a
.fpu neon-vfpv4
.thumb

.text
.align 2

.global rgb8_lab_jacobian_h4_thumb
.type rgb8_lab_jacobian_h4_thumb, %function
.thumb_func

@ void rgb8_lab_jacobian_h4_thumb(uint32_t rgb, float *out_j)
@
@ Compute the centered finite-difference Jacobian of RGB8 -> CIELAB
@ with h = 4 RGB code values:
@
@   J[:,i] = (Lab(rgb + 4 e_i) - Lab(rgb - 4 e_i)) / 8
@
@ Precondition: R,G,B are each in [4, 251], so the centered stencil stays
@ inside the RGB8 cube.  #CC6633 satisfies this.
@
@ Output is column-major, nine float32 values:
@
@   out_j[0..2] = d(L*,a*,b*)/dR
@   out_j[3..5] = d(L*,a*,b*)/dG
@   out_j[6..8] = d(L*,a*,b*)/dB
@
@ Every axis direction has Euclidean length 1, so no 1/sqrt(2) factor is
@ needed here.  A later diagonal probe such as (1,1,0) must normalize that
@ direction explicitly.
@
@ Division by 2h = 8 is implemented as multiplication by exactly
@ representable binary32 1/8 = 0.125.
@
@ Calls rgb8_to_lab_thumb from srgb8_to_lab_thumb.S.
rgb8_lab_jacobian_h4_thumb:
    push    {r4-r7, lr}
    sub     sp, sp, #28             @ 24 bytes scratch + 4 for 8-byte alignment

    mov     r4, r0                  @ base packed RGB
    mov     r5, r1                  @ output Jacobian

    @ ------------------------------------------------------------
    @ Red axis: packed offset = 4 << 16.
    movs    r6, #4
    lsls    r6, r6, #16

    add     r0, r4, r6
    mov     r1, sp                  @ plus Lab at sp + 0
    bl      rgb8_to_lab_thumb

    sub     r0, r4, r6
    add     r1, sp, #12             @ minus Lab at sp + 12
    bl      rgb8_to_lab_thumb

    ldr     r7, =c_one_eighth
    vldr    s6, [r7]

    vldr    s0, [sp, #0]
    vldr    s1, [sp, #12]
    vsub.f32 s0, s0, s1
    vmul.f32 s0, s0, s6
    vstr    s0, [r5, #0]

    vldr    s0, [sp, #4]
    vldr    s1, [sp, #16]
    vsub.f32 s0, s0, s1
    vmul.f32 s0, s0, s6
    vstr    s0, [r5, #4]

    vldr    s0, [sp, #8]
    vldr    s1, [sp, #20]
    vsub.f32 s0, s0, s1
    vmul.f32 s0, s0, s6
    vstr    s0, [r5, #8]

    @ ------------------------------------------------------------
    @ Green axis: packed offset = 4 << 8.
    movs    r6, #4
    lsls    r6, r6, #8

    add     r0, r4, r6
    mov     r1, sp
    bl      rgb8_to_lab_thumb

    sub     r0, r4, r6
    add     r1, sp, #12
    bl      rgb8_to_lab_thumb

    vldr    s6, [r7]

    vldr    s0, [sp, #0]
    vldr    s1, [sp, #12]
    vsub.f32 s0, s0, s1
    vmul.f32 s0, s0, s6
    vstr    s0, [r5, #12]

    vldr    s0, [sp, #4]
    vldr    s1, [sp, #16]
    vsub.f32 s0, s0, s1
    vmul.f32 s0, s0, s6
    vstr    s0, [r5, #16]

    vldr    s0, [sp, #8]
    vldr    s1, [sp, #20]
    vsub.f32 s0, s0, s1
    vmul.f32 s0, s0, s6
    vstr    s0, [r5, #20]

    @ ------------------------------------------------------------
    @ Blue axis: packed offset = 4.
    movs    r6, #4

    add     r0, r4, r6
    mov     r1, sp
    bl      rgb8_to_lab_thumb

    sub     r0, r4, r6
    add     r1, sp, #12
    bl      rgb8_to_lab_thumb

    vldr    s6, [r7]

    vldr    s0, [sp, #0]
    vldr    s1, [sp, #12]
    vsub.f32 s0, s0, s1
    vmul.f32 s0, s0, s6
    vstr    s0, [r5, #24]

    vldr    s0, [sp, #4]
    vldr    s1, [sp, #16]
    vsub.f32 s0, s0, s1
    vmul.f32 s0, s0, s6
    vstr    s0, [r5, #28]

    vldr    s0, [sp, #8]
    vldr    s1, [sp, #20]
    vsub.f32 s0, s0, s1
    vmul.f32 s0, s0, s6
    vstr    s0, [r5, #32]

    add     sp, sp, #28
    pop     {r4-r7, pc}

.size rgb8_lab_jacobian_h4_thumb, .-rgb8_lab_jacobian_h4_thumb

.section .rodata
.align 2
c_one_eighth: .float 0.125
