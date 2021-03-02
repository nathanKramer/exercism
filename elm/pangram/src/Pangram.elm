module Pangram exposing (isPangram)


alphabet : List String
alphabet =
    [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" ]


isPangram : String -> Bool
isPangram sentence =
    let
        sanitized =
            String.toLower sentence

        sentenceContainsLetter letter =
            String.contains letter sanitized
    in
    List.all sentenceContainsLetter alphabet
