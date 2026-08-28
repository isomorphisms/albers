# Edition cross-check for computational fixtures

Three user-supplied reproductions are now being treated as distinct measurement sources rather than interchangeable copies of the same colors.

## 1971 selected-plates paperback

This edition has ten color reproductions including the covers. It is useful because Albers comments directly on the selected plates, but he also warns that some photomechanical reproductions do not preserve delicate effects faithfully.

Useful plates already indexed here include IV-3, XV-2, XXIII-2, XI-3, VIII-2, XVIII-1, XVII-1, and the Goethe triangle.

## 2006 revised and expanded paperback — partial scan

The supplied file contains only thirteen PDF pages, but its surviving color plates are extremely useful because the accompanying commentary states the intended physical equalities explicitly.

### IV-1 — one paper strip, two appearances

The commentary says that the upper and lower small squares are parts of the **same vertical ochre paper strip**. The dark-blue and yellow horizontal bands were originally on a flap that could be lifted to reveal that identity.

This is an especially strong computational fixture because the invariant is direct:

```text
target_top_physical == target_bottom_physical
```

The scan does not reproduce those two visible portions with identical RGB8 values. Preserve that disagreement as reproduction uncertainty; never average it away.

### VI-3 — one X color, two reciprocal grounds

The commentary says both X forms are the same color and points to their connection as the physical demonstration. On the yellow ground the X appears violetish; on the violet ground it appears yellowish.

Again the synthetic invariant is:

```text
x_top_bits == x_bottom_bits
```

Use either scan-derived X sample as a source variant and duplicate it exactly across both grounds.

### XIII-2 — same dark red beside black and white

The commentary explicitly compares the dark red flanking black with **the same red** accompanying white. This gives a third same-color/different-context fixture with stripe geometry rather than isolated rectangles.

### XV-2 — intersecting reds / fluting

The plate supplies a one-hue family from light pink through several reds to a central dark red. It is useful for testing contextual deformation along an ordered family rather than a single binary contrast.

### XVII-1 — false transparency from opaque paper

Four base colors are overlaid visually by additional opaque colors chosen to read as a sheet of nearly clear film, with a doubled region on the right. This should become a multi-region fixture rather than be collapsed to pairwise colors.

The scan-derived RGB8 measurements for these plates are in `scan-samples-2006.tsv`.

## 50th-anniversary edition — structurally damaged supplied PDF

The supplied PDF has a broken/missing trailer and xref information. Its text can be recovered far enough to read the plate commentary, but its later plate-image streams are not reliable enough to use as a color measurement source.

The recovered commentary is still valuable because it expands the explicit fixture inventory. In the surviving plate-commentary section it describes, among others:

- IV-1 — the same vertical ochre strip appearing different;
- IV-3 — green presented as a grill;
- IV-4 — factually alike inner violets;
- VI-3 — the same X color on reciprocal grounds;
- VI-4 — same center color referring to brown and violet grounds;
- a second VI-4 example with connected semicircular forms of the same color;
- VII-2 — color subtraction in heavy color;
- VII-4 — centered colors made to seem alike on deep green and light grey grounds;
- VII-5 — Naples yellow and ochre made to look alike on reversed contrasting grounds;
- VII-7 — a light grey and an almost black-grey made to look alike.

These descriptions show that the book supplies **many controlled interaction fixtures**, not one privileged pair of RGB values.

## Rule for all synthetic fixtures

When the source says two pieces are physically the same color, the synthetic reconstruction must enforce bit identity:

```text
source equality -> exact RGB8 equality in the reconstruction
```

If two regions of a scan that should be identical measure differently, keep both measurements as reproduction-source variants. Never manufacture a third color by averaging them.

Likewise, when the source says two physically different colors are made to look alike, preserve their distinct sampled RGB values. The perceptual equality is the observation to test, not something to bake into the source pixels.
