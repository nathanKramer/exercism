module Pangram
  ( isPangram
  ) where

import qualified Data.Char as Char
import           Data.List

isPangram :: String -> Bool
isPangram = null . (['a' .. 'z'] \\) . map Char.toLower
