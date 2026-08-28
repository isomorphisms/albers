# Selected color plates in the 1971 scan

The 1971 paperbound *Interaction of Color* says it contains the original text with a small selection of color plates. The preface explains that the inexpensive edition keeps only ten color reproductions, including the two covers.

This inventory prevents the two-pixel work from collapsing the whole book onto a single picture. No copyrighted plate images are vendored here; this is a research index into the scan supplied for study.

## Front cover — XVII-1

The cover study uses opaque papers to create an illusion of transparency. Four principal ground colors are combined with six additional opaque shades chosen so that a central shape reads as transparent material even though no transparent material is present.

Computational use: multi-region color-mixture/transparency fixture; not a minimal two-color fixture.

## Plate XV-2 — scan page 19

Nested/intersecting reds. Albers describes three related carmine reds between a central dark red and an outer light pink; the same intermediate reds appear to change toward each neighboring color.

Computational use: contextual deformation along a roughly one-hue family; useful after the basic IV-3 fixtures.

## Plate IV-3, grid study — scan page 20

The first of the two IV-3 reproductions. Repeated colors are embedded in contrasting grid/field geometry so that identical physical color areas read differently.

Computational use: direct contextual-color fixture with repeated samples and nontrivial area/recurrence geometry. This should be sampled independently.

## Plate IV-3, rectangle study — scan page 21

Two small dark rectangles lie on large yellow and blue grounds. Albers explicitly states that the two central colors are the same physical color although they look different.

Computational use: cleanest initial contextual fixture. In a synthetic reconstruction the target RGB bits must be identical. The scan's failure to reproduce the two rectangles identically is reproduction evidence, not a reason to average them.

## Plate XXIII-2 — scan page 22

Grey-violet / grey-green equal-light-intensity study. Albers says the original screen-print version demonstrated how equal light intensity can make a boundary effectively vanish and warns that the cheaper reproduction does not preserve the effect reliably.

Computational use: later equal-lightness / boundary-visibility fixture; particularly valuable as a case where the reproduction itself is explicitly known to be inadequate.

## Plate XI-3 — scan page 23

A yellow horizontal grid crosses green, violet, and red vertical bars. The crossing regions are chosen to read as mixtures and to produce changing front/behind spatial readings.

Computational use: multi-color mixture, boundary, and depth-order fixture.

## Plate VIII-2 — scan pages 24-25

After-image demonstration: yellow circles on white in a black field and a corresponding empty white field. The exercise depends on fixation and then moving gaze, not merely static juxtaposition.

Computational use: temporal/perceptual protocol fixture rather than a static RGB-pair fixture.

## Plate XVIII-1 — scan page 26

A free-study example. Unlike the obligatory laboratory exercises, free studies are intended to explore color relatedness without one prescribed effect.

Computational use: less suitable as an oracle; useful later as an unconstrained stress case.

## Back cover — Goethe color triangle, scan page 108

A reproduction of Goethe's color triangle and its subdivisions.

Computational use: historical color-system reference, not an interaction oracle.

## Fixture order

For computational work, use the book in roughly this order:

1. IV-3 rectangle — same target, two grounds;
2. IV-3 grid — same/repeated colors under different area and recurrence geometry;
3. XV-2 — intermediate reds changed by both neighbors;
4. XXIII-2 — equal-light-intensity / disappearing boundary;
5. XI-3 — illusionary mixtures and spatial ordering;
6. XVII-1 cover — more complicated fake transparency;
7. VIII-2 — temporal after-image protocol;
8. XVIII-1 — free-study stress case;
9. Goethe triangle — historical/system reference.

The point is not to find one privileged RGB pair. The scan gives several distinct experiments, and each should become a separate fixture with its own source page, geometry, sampled regions, and reproduction caveats.
