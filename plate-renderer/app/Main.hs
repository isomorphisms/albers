module Main (main) where

import Albers.Plate

main :: IO ()
main = do
  writePlatePng "synthetic-albers-layout.png" 300 syntheticPlate
  writePlatePpm "synthetic-albers-layout.ppm" 300 syntheticPlate

-- Geometry and colors here are deliberately synthetic.  This exercises the
-- renderer without pretending that unsourced RGB values or dimensions came
-- from an Albers plate.
syntheticPlate :: PlateSpec
syntheticPlate =
  PlateSpec
    { plateEdition =
        BookEdition
          { editionLabel = "synthetic test fixture"
          , editionPublisher = "none"
          , editionYear = 0
          , editionPrinting = Nothing
          }
    , plateEvidence =
        PlateEvidence
          { plateLabel = "synthetic"
          , sourcePage = Nothing
          , commentaryNote = "Renderer test only; not book evidence."
          , rgbMeasurementNote = "Synthetic RGB8 values."
          , geometryNote = "Synthetic rectangle dimensions in millimeters."
          }
    , pageWidthMM = Mm 120
    , pageHeightMM = Mm 120
    , pageBackground = RGB8 245 245 240
    , plateLayers =
        [ ColorRect
            { colorRectBounds = RectMM (Mm 20) (Mm 20) (Mm 80) (Mm 80)
            , colorRectRGB = RGB8 190 135 75
            }
        , ColorRect
            { colorRectBounds = RectMM (Mm 45) (Mm 45) (Mm 30) (Mm 30)
            , colorRectRGB = RGB8 115 105 175
            }
        ]
    }
