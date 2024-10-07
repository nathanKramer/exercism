module [transform]

transform : Dict U64 (List U8) -> Dict U8 U64
transform = \legacy ->
    Dict.walk legacy (Dict.empty {}) \acc, score, letters ->
        letters
        |> List.map \letter -> (toLower letter, score)
        |> Dict.fromList
        |> Dict.insertAll acc

toLower = \char -> if char >= 'A' && char <= 'Z' then char + ('a' - 'A') else char
