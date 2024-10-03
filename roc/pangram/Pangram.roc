module [isPangram]

isPangram : Str -> Bool
isPangram = \sentence ->
    chars =
        sentence
        |> Str.toUtf8
        |> List.map toLowerCase
        |> Set.fromList
    List.all alphas \char -> Set.contains chars char

alphas : List U8
alphas = List.range { start: At 'a', end: At 'z' }

toLowerCase : U8 -> U8
toLowerCase = \char -> if char >= 'A' && char <= 'Z' then char + 32 else char
