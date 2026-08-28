module Albers.Plate
  ( Mm(..)
  , RGB8(..)
  , RectMM(..)
  , ColorRect(..)
  , BookEdition(..)
  , PlateEvidence(..)
  , PlateSpec(..)
  , mmToPixels
  , renderPlate
  , writePlatePng
  , writePlatePpm
  ) where

import Codec.Picture (Image, PixelRGB8(..), generateImage, imageHeight, imageWidth, pixelAt, savePngImage, DynamicImage(..))
import Data.ByteString.Builder (Builder, string8, toLazyByteString, word8)
import qualified Data.ByteString.Lazy as BL
import Data.List (find)
import Data.Word (Word8)

newtype Mm = Mm { unMm :: Double }
  deriving (Eq, Ord, Show)

data RGB8 = RGB8
  { red8   :: !Word8
  , green8 :: !Word8
  , blue8  :: !Word8
  } deriving (Eq, Show)

data RectMM = RectMM
  { rectX :: !Mm
  , rectY :: !Mm
  , rectW :: !Mm
  , rectH :: !Mm
  } deriving (Eq, Show)

data ColorRect = ColorRect
  { colorRectBounds :: !RectMM
  , colorRectRGB    :: !RGB8
  } deriving (Eq, Show)

data BookEdition = BookEdition
  { editionLabel     :: !String
  , editionPublisher :: !String
  , editionYear      :: !Int
  , editionPrinting  :: !(Maybe String)
  } deriving (Eq, Show)

data PlateEvidence = PlateEvidence
  { plateLabel         :: !String
  , sourcePage         :: !(Maybe Int)
  , commentaryNote     :: !String
  , rgbMeasurementNote :: !String
  , geometryNote       :: !String
  } deriving (Eq, Show)

data PlateSpec = PlateSpec
  { plateEdition    :: !BookEdition
  , plateEvidence   :: !PlateEvidence
  , pageWidthMM     :: !Mm
  , pageHeightMM    :: !Mm
  , pageBackground  :: !RGB8
  , plateLayers     :: ![ColorRect]
  } deriving (Eq, Show)

mmToPixels :: Int -> Mm -> Int
mmToPixels dpi (Mm mm)
  | dpi <= 0   = error "dpi must be positive"
  | mm < 0     = error "physical size must be non-negative"
  | otherwise  = round (mm * fromIntegral dpi / 25.4)

renderPlate :: Int -> PlateSpec -> Image PixelRGB8
renderPlate dpi spec = generateImage renderPixel widthPx heightPx
  where
    widthPx  = max 1 (mmToPixels dpi (pageWidthMM spec))
    heightPx = max 1 (mmToPixels dpi (pageHeightMM spec))

    renderPixel x y =
      case find (containsMM xMM yMM . colorRectBounds) (reverse (plateLayers spec)) of
        Just layer -> toPixel (colorRectRGB layer)
        Nothing    -> toPixel (pageBackground spec)
      where
        -- Sampling pixel centers makes the physical geometry primary; the
        -- raster resolution is only a rendering choice.
        xMM = pixelCenterMM dpi x
        yMM = pixelCenterMM dpi y

writePlatePng :: FilePath -> Int -> PlateSpec -> IO ()
writePlatePng path dpi spec =
  savePngImage path (ImageRGB8 (renderPlate dpi spec))

writePlatePpm :: FilePath -> Int -> PlateSpec -> IO ()
writePlatePpm path dpi spec =
  BL.writeFile path . toLazyByteString $ ppmBuilder image
  where
    image = renderPlate dpi spec

ppmBuilder :: Image PixelRGB8 -> Builder
ppmBuilder image =
  string8 "P6\n"
  <> string8 (show (imageWidth image))
  <> string8 " "
  <> string8 (show (imageHeight image))
  <> string8 "\n255\n"
  <> foldMap pixelBuilder coordinates
  where
    coordinates =
      [ (x, y)
      | y <- [0 .. imageHeight image - 1]
      , x <- [0 .. imageWidth image - 1]
      ]

    pixelBuilder (x, y) =
      case pixelAt image x y of
        PixelRGB8 r g b -> word8 r <> word8 g <> word8 b

pixelCenterMM :: Int -> Int -> Double
pixelCenterMM dpi pixel =
  (fromIntegral pixel + 0.5) * 25.4 / fromIntegral dpi

containsMM :: Double -> Double -> RectMM -> Bool
containsMM x y (RectMM (Mm rx) (Mm ry) (Mm rw) (Mm rh)) =
  x >= rx && x < rx + rw && y >= ry && y < ry + rh

toPixel :: RGB8 -> PixelRGB8
toPixel (RGB8 r g b) = PixelRGB8 r g b
