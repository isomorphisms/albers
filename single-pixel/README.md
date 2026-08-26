# Single pixel

Start with one source pixel and do not yet model any neighboring-color interaction.

## Swatch

![RGB swatch](swatch.svg)

The source color is **sRGB `#CC6633` = (204, 102, 51)**. The SVG only enlarges that one RGB value so it is visible in GitHub.

There is no single meaningful “ChatGPT color depth” exposed to us: the app, compositor, display and screenshot path can differ. For this experiment the source state is therefore fixed explicitly to ordinary **24-bit sRGB: 8 bits of red, 8 bits of green, 8 bits of blue, no alpha**. That gives a finite source set of `256^3` RGB states and matches a conservative web/GitHub image representation.

CIELAB is not the display encoding. It is a coordinate system we map the sRGB value into so that local distances are at least approximately perceptual. Here the assumptions are standard sRGB primaries/transfer curve and D65 reference white.

For `#CC6633`, the conversion gives approximately:

- `L* = 54.6400`
- `a* = 36.9064`
- `b* = 46.1234`

So the same pixel can be regarded as the point

`(204, 102, 51)_RGB8 -> (54.6400, 36.9064, 46.1234)_Lab`.

## The first deformation space

The Lab coordinates are continuous, but our actual RGB8 source is a lattice. The smallest available source deformations away from this pixel are therefore one-code changes such as `(R+1)`, `(G-1)`, and so on.

Mapping those six immediate neighbors into CIELAB gives:

| RGB8 move | change in `(L*, a*, b*)` | `Delta E*ab` |
| --- | --- | ---: |
| `R - 1` | `(-0.1472, -0.3964, -0.1990)` | `0.4674` |
| `R + 1` | `(+0.1476, +0.3954, +0.1993)` | `0.4667` |
| `G - 1` | `(-0.2043, +0.5128, -0.2127)` | `0.5915` |
| `G + 1` | `(+0.2056, -0.5146, +0.2137)` | `0.5940` |
| `B - 1` | `(-0.0091, -0.0428, +0.4789)` | `0.4809` |
| `B + 1` | `(+0.0093, +0.0437, -0.4827)` | `0.4848` |

For the Jacobian experiment, use a centered radius of **4 RGB codes** rather than 1:

`J[:,i] = (Lab(x + 4 e_i) - Lab(x - 4 e_i)) / 8`.

The denominator is therefore exactly `8`, so its reciprocal `1/8 = 0.125` is exact in binary32. At `#CC6633` this gives approximately

```text
             dR       dG       dB
 dL*       0.1474   0.2049   0.0092
 da*       0.3959  -0.5135   0.0433
 db*       0.1991   0.2132  -0.4804
```

These three probes are along the coordinate axes `(1,0,0)`, `(0,1,0)`, `(0,0,1)`, whose lengths are already 1. Therefore there is no `1/sqrt(2)` normalization in this Jacobian. A diagonal direction such as `(1,1,0)` has length `sqrt(2)` and must carry that normalization when we test it.

This is already more useful than saying that the pixel lives in a generic three-dimensional color ball. At this point the available source moves are discrete, anisotropic after the Lab map, and bounded by the sRGB gamut. Later we can ask what identifications perception introduces, and whether the relevant local neighborhoods change when another color is placed next to this one.

`Delta E*ab` here is just Euclidean distance in CIELAB. CIELAB is only approximately perceptually uniform, so this is a first coordinate model, not a claim that equal Lab distances always look equally different.

## ARM/Thumb implementation

The numerical experiment is kept in **assembly rather than Idriç**.

[`srgb8_to_lab_thumb.S`](srgb8_to_lab_thumb.S) implements

`sRGB8 -> linear RGB -> XYZ/D65 -> CIELAB`.

[`lab_jacobian_h4_thumb.S`](lab_jacobian_h4_thumb.S) computes the centered `h=4` Jacobian by calling that conversion at the six required RGB lattice points and multiplying each difference by the exactly represented float32 value `0.125`.

The target is the phone environment we have been using:

- SC9863A device
- 32-bit `armeabi-v7a` / `armv7l` userland
- Thumb-2
- VFPv4 available
- NEON available, although unnecessary for one pixel

The color-conversion routine takes a packed `0x00RRGGBB` value in a core register and writes three `float32` Lab coordinates to memory. The Jacobian routine writes nine `float32` values, grouped as the R, G, then B derivative columns. The public boundaries remain compatible with the Android soft-float ABI while using VFP scalar instructions internally.

For readability, the first color conversion calls `powf` for the nonlinear sRGB transfer curve and computes the CIELAB cube root with eight Newton steps in Thumb/VFP instructions. Since RGB8 has only 256 possible channel codes, a later optimized version can replace `powf` with a 256-entry linear-light lookup table without changing the source color model.
