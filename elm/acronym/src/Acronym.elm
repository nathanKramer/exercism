module Acronym exposing (abbreviate)


abbreviate : String -> String
abbreviate =
    String.replace "-" " "
        >> String.words
        >> List.map (String.slice 0 1)
        >> String.concat
        >> String.toUpper
