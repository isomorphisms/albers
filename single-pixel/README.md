# Single pixel

Start with one source pixel and do not yet model any neighboring-color interaction.

## Swatch

![RGB swatch](swatch.svg)

The source color is **sRGB `#CC6633` = (204, 102, 51)**. The SVG only enlarges that one RGB value so it is visible in GitHub.

There is no single meaningful “ChatGPT color depth” exposed to us: the app, compositor, display and screenshot path can differ. For this experiment the source state is therefore fixed explicitly to ordinary **24-bit sRGB: 8 bits of red, 8 bits of green, 8 bits of blue, no alpha**. That gives a finite source set of `256^3` RGB states and matches a conservative web/GitHub image representation.

CIELAB is not the display encoding. It is a coordinate system we map the sRGB value into so that color differences can be discussed in approximately perceptual coordinates. Here the assumptions are standard sRGB primaries/transfer curve and D65 reference white.

For `#CC6633`, the conversion gives approximately:

- `L* = 54.6400`
- `a* = 36.9064`
- `b* = 46.1234`

So the same pixel can be regarded as the point

`(204, 102, 51)_RGB8 -> (54.6400, 36.9064, 46.1234)_Lab`.

## A perceptible deformation shell

The first Jacobian experiment used tiny RGB-code perturbations. Keep that as a local diagnostic, but it should not define the main deformation experiment. A one-code RGB move is often below useful human discrimination, and CIELAB already supplies a nonlinear global coordinate map in which we can make substantially larger comparisons directly.

The obvious continuous model around one Lab point is a sphere. We cannot represent a whole sphere, and the exactly symmetric unit face/body diagonals require `sqrt(2)` and `sqrt(3)`, neither of which has a finite binary representation.

Instead choose one sphere whose radius and sampled coordinates are all **exact binary fractions**.

Use

`r = 145/16 = 9.0625` Lab units.

Three canonical vectors lie exactly on this same sphere:

```text
axis       (145,   0,  0) / 16 = (9.0625, 0,      0)
face-like  (100, 105,  0) / 16 = (6.25,   6.5625, 0)
body-like  ( 80,  84, 87) / 16 = (5,      5.25,   5.4375)
```

The equal-radius identities are exact integers:

```text
100^2 + 105^2             = 145^2
 80^2 +  84^2 + 87^2      = 145^2
```

Therefore no square root is needed to store or verify these displacements. All coordinates are multiples of `1/16`, so they are exact in binary32, and every vector has exact Euclidean CIELAB length `9.0625`.

The face-like vector is close to the symmetric `(1,1,0)` direction without approximating `1/sqrt(2)`. The body-like vector is close to `(1,1,1)` without approximating `1/sqrt(3)`.

Permutations and sign changes give a useful finite sampling of the sphere:

- axis orbit: 6 points
- face-like orbit: 24 points
- body-like orbit: 48 points
- total: **78 deformation directions on one exact-radius shell**

That gives us something much closer to the deformation picture we actually care about: substantial changes in many directions around the color, rather than microscopic axis derivatives.

The shell is a CIELAB `Delta E*ab` sphere. CIELAB is only approximately perceptually uniform, so equal radius does not mean equal perceived difference everywhere. That nonuniformity is part of the experiment rather than something we should erase by pretending the local Jacobian is the whole geometry.

When shell points are rendered, the next boundary is explicit: `Lab -> XYZ/D65 -> sRGB -> RGB8`, with an sRGB-gamut check before quantization. The geometric Lab displacement and the final displayable RGB8 swatch should remain separately recorded.

## Local Jacobian diagnostic

[`lab_jacobian_h4_thumb.S`](lab_jacobian_h4_thumb.S) remains as a diagnostic of the local `RGB8 -> Lab` map. It uses the centered stencil

`J[:,i] = (Lab(x + 4 e_i) - Lab(x - 4 e_i)) / 8`.

The denominator is exactly `8`, so `1/8 = 0.125` is exact in binary32. This is useful for measuring local anisotropy, but it is no longer the primary deformation sampling scheme.

## ARM/Thumb implementation

The numerical experiment is kept in **assembly rather than Idriç**.

[`srgb8_to_lab_thumb.S`](srgb8_to_lab_thumb.S) implements

`sRGB8 -> linear RGB -> XYZ/D65 -> CIELAB`.

[`lab_shell_r9_0625_thumb.S`](lab_shell_r9_0625_thumb.S) records the exact-binary deformation shell and applies its three canonical generators using Thumb/VFP scalar additions. Signed coordinate permutations are intentionally kept as a separate combinatorial layer.

[`lab_jacobian_h4_thumb.S`](lab_jacobian_h4_thumb.S) keeps the earlier local finite-difference diagnostic.

The target is the phone environment we have been using:

- SC9863A device
- 32-bit `armeabi-v7a` / `armv7l` userland
- Thumb-2
- VFPv4 available
- NEON available, although unnecessary for one pixel

The public boundaries remain compatible with the Android soft-float ABI while using VFP scalar instructions internally.
