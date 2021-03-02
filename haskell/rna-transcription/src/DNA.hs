module DNA (toRNA) where

import qualified Data.Map as M

translation :: M.Map Char Char
translation =
  M.fromList
    [ ('G', 'C'),
      ('C', 'G'),
      ('T', 'A'),
      ('A', 'U')
    ]

toRNA :: String -> Either Char String
toRNA =
  mapM translate
  where
    translate dna = case M.lookup dna translation of
      Just rna -> Right rna
      Nothing -> Left dna
