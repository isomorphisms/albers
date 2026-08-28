# Two pixels side by side

This directory starts with the smallest computational boundary, but the first real Albers fixtures are anchored in **Plate IV-3** of *Interaction of Color*.

## Minimal state

At the source/image level a two-color state can still be written as an ordered pair

`(target RGB8, context RGB8)`.

Using the single-pixel map independently gives the non-contextual baseline

`(target RGB8, context RGB8) -> (target Lab, context Lab)`.

That independent product is the thing a contextual model has to beat.

## Plate IV-3 rectangle fixture

Albers's exercise uses **two small rectangles of exactly the same color and size on large grounds of very different colors**. The area imbalance is intentional: the ground is the influencing color and the small rectangle is the influenced color.

The scan does not preserve the supposed equality perfectly: the upper and lower rectangles digitize to different RGB values. That difference is a property of this reproduction/scanning path, not something to average into a fictitious third color.

So keep both scan measurements as alternative source choices and, within each experiment, duplicate the chosen target bits exactly:

```text
variant_upper_target:
    A = (target = #665136, context = #E6C13C)
    B = (target = #665136, context = #607AAD)

variant_lower_target:
    A = (target = #785E3B, context = #E6C13C)
    B = (target = #785E3B, context = #607AAD)
```

The invariant is not the particular brown chosen from the scan. The invariant is:

```text
target_A_bits == target_B_bits
context_A_bits != context_B_bits
```

The disagreement between `#665136` and `#785E3B` is retained as evidence about reproduction uncertainty and as a sensitivity test. It is not averaged away.

These RGB values are scan-derived references, not claims about the exact original physical papers. See [`SOURCES.md`](SOURCES.md), [`plate-iv3-scan-samples.tsv`](plate-iv3-scan-samples.tsv), and [`SELECTED-PLATES.md`](SELECTED-PLATES.md).

## Plate IV-3 also contains a second fixture

The facing IV-3 reproduction contains the **grid experiment**: colors repeated inside contrasting fields. That is another direct contextual-color fixture and should be sampled independently rather than reduced to the rectangle example.

The book therefore gives us at least two distinct IV-3 geometries:

1. repeated color in a grid/field arrangement;
2. identical small rectangles on two large grounds.

## Geometry matters

A literal two-pixel 1:1 display should remain as a control, but it is not expected to reproduce the full Plate IV-3 effect. The historical exercise deliberately places a small target in a much larger ground, and Albers warns that unfavorable area distribution can weaken or annul the illusion.

Therefore test at least:

1. `1 target pixel : 1 context pixel` -- minimal computational control;
2. a small target block centered in a large uniform ground -- rectangle geometry;
3. the same target block in both grounds with **identical target bits**;
4. the IV-3 grid geometry;
5. both scan-derived target choices above, without averaging them.

## Questions

- With the target bits fixed, does the perceived target move when only the context changes?
- How much context area is needed before the effect becomes visible?
- Does the local CIELAB description of the target remain identical while human reports diverge?
- Can a contextual model predict the direction or magnitude of that divergence?
- How stable is the effect under the two scan-derived target choices?
- What happens when the two grounds are swapped left/right or top/bottom?

Keep the raw RGB8 state, independent CIELAB coordinates, display geometry, reproduction provenance, and any later perceptual/context relation as separate layers. Do not introduce quotient/groupoid/stack language unless the experiments actually require it.
