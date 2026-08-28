module Main (main) where

import Albers.Plate (writePlatePng, writePlatePpm)
import Albers.PlateData (xv2YaleFourthPrinting1972Scan)

main :: IO ()
main = do
  writePlatePng "xv-2-yale-fourth-printing-1972.png" 300 xv2YaleFourthPrinting1972Scan
  writePlatePpm "xv-2-yale-fourth-printing-1972.ppm" 300 xv2YaleFourthPrinting1972Scan
