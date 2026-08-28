# Two pixels side by side

This directory starts with the smallest computational boundary, but the first real Albers fixture is now anchored in **Plate IV-3** of *Interaction of Color*.

## Minimal state

At the source/image level a two-color state can still be written as an ordered pair

`(target RGB8, context RGB8)`.

Using the single-pixel map independently gives the non-contextual baseline

`(target RGB8, context RGB8) -> (target Lab, context Lab)`.

That independent product is the thing a contextual model has to beat.

## Plate IV-3 fixture

Albers's actual exercise is not an equal-area pair of adjacent colors. It uses **two small rectangles of exactly the same color and size on large grounds of very different colors**. The area imbalance is intentional: the ground is the influencing color and the small rectangle is the influenced color.

So the first fixture is two states with a bit-identical target:

```text
A = (target = #6F5839, context = #E6C13C)
B = (target = #6F5839, context = #607AAD)
```

or in RGB8:

```text
target        = (111, 88, 57)
yellow_ground = (230, 193, 60)
blue_ground   = (96, 122, 173)
```

These values are sampled/normalized from the embedded image of Plate IV-3 in the 1971 selected-plates scan. They are **not** claims about the exact original physical papers. See [`SOURCES.md`](SOURCES.md) and [`plate-iv3-scan-samples.tsv`](plate-iv3-scan-samples.tsv).

## Geometry matters

A literal two-pixel 1:1 display should remain as a control, but it is not expected to reproduce the full Plate IV-3 effect. The historical exercise deliberately places a small target in a much larger ground, and Albers warns that unfavorable area distribution can weaken or annul the illusion.

Therefore test at least:

1. `1 target pixel : 1 context pixel` -- minimal computational control;
2. a small target block centered in a large uniform ground -- Albers-style geometry;
3. the same target block in both grounds with **identical target bits**;
4. optional grid geometry corresponding to the other half of Plate IV-3.

## Questions

- With the target bits fixed, does the perceived target move when only the context changes?
- How much context area is needed before the effect becomes visible?
- Does the local CIELAB description of the target remain identical while human reports diverge?
- Can a contextual model predict the direction or magnitude of that divergence?
- What happens when the two grounds are swapped left/right or top/bottom?

Keep the raw RGB8 state, independent CIELAB coordinates, display geometry, and any later perceptual/context relation as separate layers. Do not introduce quotient/groupoid/stack language unless the experiments actually require it.
