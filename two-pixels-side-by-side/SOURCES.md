# Interaction of Color source trail for the contextual-color experiment

The first historical fixture is **Plate IV-3** from Josef Albers's *Interaction of Color*: the same physical color is placed on two very different grounds so that it appears different.

This file records sources, reproduction status, and the provenance of numerical samples. It deliberately does **not** vendor copyrighted plate images.

## 1971 selected-plates edition

A user-supplied PDF of the Yale paperback was inspected directly. The scan itself states that it was digitized by the Internet Archive in 2009 and identifies the Internet Archive item as:

- `interactionofcol00albe`
- https://archive.org/details/interactionofcol00albe

The copyright page states copyright 1963 by Yale University, paperbound edition copyright 1971 by Yale University, and `All rights reserved`. Therefore the scan and its plate images are research sources, not repository assets.

## What Albers says to build

Chapter IV, *A color has many faces -- the relativity of color*, gives the first exercise as:

- two small rectangles;
- exactly the same color and size;
- placed on large grounds of very different colors;
- with the goal that the identical small colors look as different as possible.

Albers explicitly distinguishes the **influencing color** (the large ground) from the **influenced color** (the small rectangle).

He also warns that area distribution is part of the effect. Small targets on small or multiply interlocked grounds can weaken or annul the illusion. Therefore a literal 1:1 two-pixel pair is useful only as a baseline; the actual Albers fixture needs a small target embedded in a substantially larger context.

The selected-plates edition points specifically to **Plate IV-3**.

## Plate IV-3 in this scan

The two-page reproduction contains two demonstrations:

1. a grid version, where the same color is distributed repeatedly against two grounds;
2. a simpler pair of small dark rectangles on large yellow and blue grounds.

The second is the cleaner computational fixture because it isolates one influenced color against two influencing colors.

## Sampling the embedded scan image

The PDF page containing the simple rectangle pair contains an embedded RGB JPEG. Numerical samples were taken from that embedded image directly rather than from a screen capture or a rescaled rendering.

Sampling method:

- source image: embedded RGB JPEG from PDF page 21;
- target samples: median RGB8 over interior regions well inside each small rectangle;
- ground samples: median RGB8 over four nearby regions surrounding each rectangle, excluding edges and the rectangle itself;
- no claim is made that these RGB values describe the original physical paper.

Observed scan medians:

| role | RGB8 | hex |
| --- | --- | --- |
| yellow ground near upper target | `(230, 193, 60)` | `#E6C13C` |
| blue ground near lower target | `(96, 122, 173)` | `#607AAD` |
| upper occurrence of nominally identical target | `(102, 81, 54)` | `#665136` |
| lower occurrence of nominally identical target | `(120, 94, 59)` | `#785E3B` |

The two target occurrences are supposed to be the same physical color, but the scan does not encode them identically. Naively interpreting the scan samples as sRGB gives a CIELAB difference of roughly `Delta E*ab = 7.6` between those two target reproductions. That difference belongs to the printing/scanning/reproduction path, not to the Albers experiment.

For a digital fixture we therefore force the target to be **bit-identical in both contexts**. A neutral way to derive the first scan-based target is the channelwise midpoint of the two sampled target medians:

`target = (111, 88, 57) = #6F5839`

Initial scan-derived fixture:

```text
target        = #6F5839  = (111, 88, 57)
yellow_ground = #E6C13C  = (230, 193, 60)
blue_ground   = #607AAD  = (96, 122, 173)
```

These are **reproduction-derived starting values**, not authoritative specifications of Albers's original papers.

## Other web references

### Yale A&AePortal

- https://aaeportal.com/
- Useful for chapter/plate cataloging and comparison with the complete digital edition.
- Public viewability does not establish an open-content license.

### Metropolitan Museum of Art

- https://www.metmuseum.org/art/collection/search/737721
- Useful as a separate institutional reference to the original portfolio.
- The Met marks the work with Artists Rights Society rights information; do not vendor its image.

### Josef & Anni Albers Foundation

- https://www.albersfoundation.org/alberses/teaching/interaction-of-color
- Useful background on Albers's course, student exercises, and the book.

## Internet Archive CLI

`isomorphisms/internetarchive` is the user's fork of jjjjake's `internetarchive` package. It provides the `ia` command for Archive.org search, metadata, and downloads.

The fork documents that access-restricted downloads depend on logged-in Archive.org cookies; an IA-S3 API key by itself does not unlock print-disabled books.
