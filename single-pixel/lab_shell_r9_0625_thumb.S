.syntax unified
.arch armv7-a
.fpu neon-vfpv4
.thumb

@ Exact-binary CIELAB deformation shell.
@
@ Rather than approximate sqrt(2) and sqrt(3) in binary32, choose rational
@ points that lie exactly on one sphere and whose coordinates are dyadic
@ fractions.  The common radius is
@
@     r = 145 / 16 = 9.0625
@
@ so r itself is exact in binary32.
@
@ Three canonical generators are enough to cover the obvious cube-like
@ directions.  Coordinate permutations and sign changes generate the rest.
@
@ axis:
@     (145,   0,  0) / 16 = (9.0625, 0, 0)
@
@ face-like:
@     (100, 105,  0) / 16 = (6.25, 6.5625, 0)
@     100^2 + 105^2 = 145^2
@
@ body-like:
@     (80, 84, 87) / 16 = (5, 5.25, 5.4375)
@     80^2 + 84^2 + 87^2 = 145^2
@
@ Thus every listed vector has exactly the same Euclidean CIELAB length,
@ 9.0625, without any sqrt instruction or irrational constant.
@
@ Orbits under signed coordinate permutations:
@     axis       6 points
@     face-like 24 points
@     body-like 48 points
@                --------
@                78 points on one shell
@
@ The vectors intentionally approximate the symmetric face/body diagonal
@ directions instead of representing (1,1,0)/sqrt(2) or
@ (1,1,1)/sqrt(3).  Exact equal-component diagonals cannot be represented
@ exactly with finite binary fractions.

.section .rodata
.align 2

.global lab_shell_radius
lab_shell_radius:
    .float 9.0625

.global lab_shell_generators
lab_shell_generators:
    @ axis generator
    .float 9.0625, 0.0, 0.0

    @ face-diagonal-like generator
    .float 6.25, 6.5625, 0.0

    @ body-diagonal-like generator
    .float 5.0, 5.25, 5.4375

.text
.align 2

.global lab_add_shell_generator_thumb
.type lab_add_shell_generator_thumb, %function
.thumb_func

@ void lab_add_shell_generator_thumb(const float *center,
@                                    uint32_t generator,
@                                    float *out)
@
@ center:    r0 -> L*,a*,b*
@ generator r1 = 0 axis, 1 face-like, 2 body-like
@ out:       r2 -> center + canonical generator
@
@ This helper only applies the three canonical positive generators.  Signed
@ permutations are deliberately a separate combinatorial layer so we can
@ test those choices explicitly rather than hide them in this routine.
lab_add_shell_generator_thumb:
    push    {r4, lr}

    mov     r4, r2

    @ byte offset = generator * 3 floats * 4 bytes = generator * 12
    add     r3, r1, r1, lsl #1
    lsls    r3, r3, #2
    ldr     r2, =lab_shell_generators
    add     r2, r2, r3

    vldr    s0, [r0, #0]
    vldr    s1, [r0, #4]
    vldr    s2, [r0, #8]

    vldr    s3, [r2, #0]
    vldr    s4, [r2, #4]
    vldr    s5, [r2, #8]

    vadd.f32 s0, s0, s3
    vadd.f32 s1, s1, s4
    vadd.f32 s2, s2, s5

    vstr    s0, [r4, #0]
    vstr    s1, [r4, #4]
    vstr    s2, [r4, #8]

    pop     {r4, pc}

.size lab_add_shell_generator_thumb, .-lab_add_shell_generator_thumb
