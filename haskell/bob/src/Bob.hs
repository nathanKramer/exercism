module Bob (responseFor) where

import qualified Data.Char as C
import qualified Data.List as L

responseFor :: String -> String
responseFor str
  | question && yelling = "Calm down, I know what I'm doing!"
  | silent = "Fine. Be that way!"
  | question = "Sure."
  | yelling = "Whoa, chill out!"
  | otherwise = "Whatever."
  where
    trim = L.dropWhileEnd C.isSpace . L.dropWhile C.isSpace
    sanitized = trim str
    alphas = filter C.isAlpha $ sanitized
    silent = null $ sanitized
    question = not silent && last sanitized == '?'
    speaking = not silent && not (null alphas)
    yelling = speaking && all C.isUpper alphas
