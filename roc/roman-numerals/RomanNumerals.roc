module [roman]

numerals = Dict.fromList [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I"),
]

roman : U64 -> Result Str _
roman = \number ->
    nums =
        numerals
        |> Dict.keys
        |> List.sortDesc

    (resultString, _) = List.walk nums ("", number) \(result, n), denominator ->
        if (n // denominator) >= 1 then
            romanChar = numerals |> Dict.get denominator |> Result.withDefault ""
            newChars = Str.repeat romanChar (n // denominator)
            (Str.concat result newChars, Num.rem n denominator)
        else
            (result, n)

    Ok resultString

