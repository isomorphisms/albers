module Albers.PlateData
  ( yale1971FourthPrinting
  , xv2Yale1971Scan
  ) where

import Albers.Plate

yale1971FourthPrinting :: BookEdition
yale1971FourthPrinting =
  BookEdition
    { editionLabel = "Interaction of Color: text of the original edition with selected plates"
    , editionPublisher = "Yale University Press"
    , editionYear = 1971
    , editionPrinting = Just "Fourth printing"
    }

-- | First measured plate record.
--
-- The RGB values are measurements of this particular digitized copy, not a
-- claim about the original paper colors.  Each value is the per-channel median
-- of a 51 x 51 pixel interior patch in a 200 dpi render, chosen away from
-- printed boundaries and visible defects.
--
-- The geometry is likewise measured from the scan.  The PDF page MediaBox is
-- 410 x 565 pt; those dimensions are mapped to millimeters and the visible
-- nested forms are approximated by four-vertex polygons.  This preserves the
-- plate's proportions while keeping scan evidence distinct from claims about
-- the physical trim size of every edition.
xv2Yale1971Scan :: PlateSpec
xv2Yale1971Scan =
  PlateSpec
    { plateEdition = yale1971FourthPrinting
    , plateEvidence =
        PlateEvidence
          { plateLabel = "XV-2"
          , reproductionPdfPage = Just 19
          , commentaryPdfPages = [17]
          , commentaryNote =
              "Albers uses XV-2 to discuss middle mixtures and color "
              ++ "interpenetration: three closely related carmine reds sit "
              ++ "between a central dark red and an outer light pink, and "
              ++ "their apparent lightness shifts toward the neighboring colors."
          , rgbMeasurementNote =
              "Median RGB8 interior samples from a 200 dpi render of PDF page 19. "
              ++ "Outer to inner: (236,187,170), (238,105,84), "
              ++ "(242,85,54), (237,65,29), (207,43,5)."
          , geometryNote =
              "Approximate quadrilateral vertices measured from the 200 dpi "
              ++ "scan and converted through the page MediaBox (410 x 565 pt)."
          }
    , pageWidthMM = Mm 144.6388888889
    , pageHeightMM = Mm 199.3194444444
    , pageBackground = RGB8 232 236 218
    , plateLayers =
        [ layer (RGB8 236 187 170)
            [ p 71.75 10.92
            , p 2.41 80.24
            , p 70.99 150.70
            , p 141.21 80.49
            ]
        , layer (RGB8 238 105 84)
            [ p 71.75 28.69
            , p 10.67 89.38
            , p 70.99 150.44
            , p 132.07 89.25
            ]
        , layer (RGB8 242 85 54)
            [ p 71.62 45.83
            , p 19.68 98.01
            , p 70.99 150.19
            , p 123.30 98.01
            ]
        , layer (RGB8 237 65 29)
            [ p 71.37 62.84
            , p 28.19 106.52
            , p 70.99 150.19
            , p 114.80 106.64
            ]
        , layer (RGB8 207 43 5)
            [ p 71.75 79.60
            , p 36.06 114.13
            , p 70.99 150.19
            , p 106.92 114.01
            ]
        ]
    }
  where
    p x y = PointMM (Mm x) (Mm y)
    layer rgb points = ColorLayer (Polygon points) rgb
