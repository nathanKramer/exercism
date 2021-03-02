module Etl exposing (transform)

import Dict exposing (Dict)


transform : Dict Int (List String) -> Dict String Int
transform input =
    let
        convertScoreEntry ( score, letters ) =
            letters
                |> List.map (\l -> ( String.toLower l, score ))
    in
    Dict.toList input
        |> List.concatMap convertScoreEntry
        |> Dict.fromList
