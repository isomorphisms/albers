# Plate renderer

This experiment keeps three things separate:

1. **book evidence** — edition, plate number, Albers commentary, and source pages;
2. **measured scan data** — RGB8 samples and geometry measured from a specific digitization;
3. **rendering** — a Haskell rasterizer that converts millimeter geometry to PNG or P6 PPM at an arbitrary DPI.

The physical-coordinate model is deliberate. Changing from 150 to 300 to 600 dpi changes the raster density, not the plate proportions.

## Build and run

```sh
cabal run albers-plate-demo
```

The current demo writes:

```text
xv-2-yale-fourth-printing-1972.png
xv-2-yale-fourth-printing-1972.ppm
```

at 300 dpi.

The reusable functions are:

```haskell
renderPlate   :: Int -> PlateSpec -> Image PixelRGB8
writePlatePng :: FilePath -> Int -> PlateSpec -> IO ()
writePlatePpm :: FilePath -> Int -> PlateSpec -> IO ()
```

`PlateSpec` supports rectangles and polygons. Later layers cover earlier layers.

## First sourced record: XV-2

Source: *Interaction of Color: text of the original edition with selected plates*, Yale University Press. The paperbound edition is copyright 1971; this scanned copy identifies itself as the **fourth printing, 1972**.

The selected-plates PDF places reproduction XV-2 on PDF page 19. Albers discusses it on PDF page 17 while explaining middle mixtures and color interpenetration. He describes three closely related carmine reds between a central dark red and an outer light pink, with the intermediate colors changing appearance toward their neighbors.

Measured RGB8 values in this digitization, outer to inner:

| region | RGB8 |
| --- | --- |
| outer light pink | `(236, 187, 170)` |
| carmine 1 | `(238, 105, 84)` |
| carmine 2 | `(242, 85, 54)` |
| carmine 3 | `(237, 65, 29)` |
| central dark red | `(207, 43, 5)` |

Each value is the per-channel median of a 51 x 51 pixel interior patch in a 200 dpi render. These are measurements of **this scan**, not assertions about the RGB values of Albers's original colored papers.

The page MediaBox is 410 x 565 points. The current XV-2 reconstruction maps that scan coordinate system to millimeters and approximates each nested visible form with a quadrilateral. This gives us a reproducible geometric baseline without pretending that the scan alone establishes the physical trim dimensions of every edition.

## Editions

Edition geometry belongs in the data, not in the rasterizer. Different editions really are different physical objects. For example, Yale lists the 2013 50th Anniversary Edition at 6.00 x 9.25 inches and the 2009 New Complete Edition at 10.70 x 13.20 inches. We should therefore add each edition as a separate geometry source instead of scaling one canonical page blindly.

## Data policy

For every added plate, record:

- edition year, printing, and printing year when known;
- plate label;
- reproduction page and commentary page(s);
- a short paraphrase of the relevant commentary;
- RGB sampling method and values;
- geometry measurement method;
- whether dimensions are scan-derived or independently verified from a physical edition.

Do not silently replace scan RGB with display-picked values or claim that a scan measurement is the original paper color.
