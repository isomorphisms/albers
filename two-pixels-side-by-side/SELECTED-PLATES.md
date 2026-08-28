# Interaction of Color fixture inventory

Do not reduce *Interaction of Color* to one privileged RGB pair. The supplied editions contain several different controlled perceptual experiments, and each should become its own fixture with its own geometry, source edition, sampled regions, and reproduction caveats.

No copyrighted plate images are vendored here. This directory records measurements and source descriptions only.

See also [`EDITION-CROSSCHECK.md`](EDITION-CROSSCHECK.md), [`scan-samples-2006.tsv`](scan-samples-2006.tsv), and the earlier 1971 scan notes.

## First tier — exact physical equality under changing context

### IV-1 — same ochre strip, two grounds

The 2006 revised/expanded plate commentary states that the upper and lower visible ochre areas are portions of the same vertical paper strip. They appear different against large blue and orange grounds.

Computational invariant:

```text
target_A_bits == target_B_bits
context_A_bits != context_B_bits
```

The 2006 scan samples the two target appearances differently; keep those as two alternative source variants and duplicate whichever target variant is selected exactly across both synthetic contexts.

### IV-3 — same color on strongly different grounds

The 1971 selected-plates edition contains both a grill/field study and a small-rectangle study. In the rectangle version, Albers says the two central colors are physically the same although they look different.

Computational use: second same-target fixture with different geometry and a separate reproduction path from IV-1.

### IV-4 — factually alike inner violets

The recoverable 50th-anniversary commentary says the smaller inner violets are factually alike while one appears to refer toward the surrounding lighter violet.

Computational use: same-color invariant within a much narrower hue family.

### VI-3 — same X color, reciprocal grounds

The 2006 commentary says both X forms are the same color. On a yellow ground the X reads violetish; on a violet-grey ground it reads yellowish. Their physical connection is included to reveal their identity.

Computational use: excellent same-target fixture with long thin geometry instead of small blocks.

### VI-4 — same center color on brown/violet grounds

The recoverable 50th-anniversary commentary describes center squares that appear as exchanged brown/violet grounds but are precisely alike.

Computational use: another direct same-target/different-ground oracle once a usable plate image is obtained.

## Second tier — physically different colors made perceptually similar

### VII-2 — subtraction of color

The 50th-anniversary commentary introduces the inverse problem: two physically different colors are to look alike.

Computational invariant:

```text
target_A_bits != target_B_bits
perceived_A ~= perceived_B
```

Do not erase the physical distinction in the source pixels.

### VII-4 — centers on deep green and light grey

The recoverable commentary describes small central rectangles that seem alike under strongly different grounds.

### VII-5 — Naples yellow and ochre

Naples yellow and ochre are explicitly described as physically different colors whose contrast can be transformed by reversed grounds until they look similar or alike.

### VII-7 — very light grey versus almost black-grey

A deliberately extreme solution: a very light grey and a dark almost-black grey are made to appear alike under suitable contexts.

Computational use: severe stress test for any contextual model.

## Third tier — structured multi-color effects

### XIII-2 — Bezold / after-image stripe study

The 2006 commentary compares the dark red flanking black with **the same red** accompanying white. This gives another exact-same-color fixture, now in repeated stripe geometry. The scan-derived measurements are in `scan-samples-2006.tsv`.

### XV-2 — intersecting reds / fluting

A one-hue family runs from pale pink through several related reds to a central dark red. The same intermediate bands read differently toward their neighboring colors, creating the fluting effect.

Computational use: contextual deformation along an ordered hue/lightness family rather than a binary pair.

### XVII-1 — false transparency from opaque colors

Four base colors plus additional opaque patches are chosen so that the added regions read as a nearly transparent sheet, with doubled overlap on the right.

Computational use: multi-region illusion of transparency. Preserve all regions; do not reduce it to independent pairs.

### XI-3 — crossing colors / mixture and depth

The 1971 scan uses a yellow horizontal grid crossing green, violet, and red vertical bars. Crossing regions are chosen to read as mixtures and change front/behind spatial interpretation.

Computational use: mixture, boundary, and depth-order fixture.

### XXIII-2 — equal-light-intensity / vanishing boundary

Albers explicitly warns that the inexpensive photomechanical reproduction does not preserve this delicate effect reliably. The original screen print demonstrated that equal light intensity could make the boundary nearly disappear.

Computational use: important negative-control lesson as well as a later boundary-visibility fixture. Do not calibrate an oracle from a reproduction that Albers himself says is inadequate.

### VIII-2 — after-image protocol

Yellow circles on white against black plus a corresponding empty white field. This depends on fixation followed by a gaze shift.

Computational use: temporal perceptual protocol, not a static RGB-pair fixture.

## Historical / less constrained material

- XVIII-1 — free-study example; useful as a later stress case, not a clean oracle.
- Goethe color triangle — historical color-system reference, not an interaction oracle.

## Suggested implementation order

1. IV-1 — same strip, blue versus orange ground;
2. VI-3 — same X, violet-grey versus yellow ground;
3. IV-3 rectangle — same target, yellow versus blue ground;
4. XIII-2 — same dark red with black versus white;
5. IV-3 grill — recurrence/area geometry;
6. VII-5 and VII-7 — physically different targets made perceptually alike;
7. XV-2 — one-hue contextual deformation family;
8. XXIII-2 — equal-lightness boundary experiment, with reproduction caveat;
9. XI-3 and XVII-1 — multi-region mixture/transparency;
10. VIII-2 — temporal after-image protocol.

The source book gives a family of experiments. The computational repository should preserve that family rather than searching for a single canonical color pair.
