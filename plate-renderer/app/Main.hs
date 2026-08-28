module Main (main) where

import Albers.Plate (writePlatePng, writePlatePpm)
import Albers.PlateData (xv2Yale1971Scan)

main :: IO ()
main = do
  writePlatePng "xv-2-yale-1971.png" 300 xv2Yale1971Scan
  writePlatePpm "xv-2-yale-1971.ppm" 300 xv2Yale1971Scan
