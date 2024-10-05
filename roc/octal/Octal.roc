module [parse]

parse : Str -> Result U64 _
parse = \string ->
    if string == "" then
        Err Empty
        else

    octals =
        string
        |> Str.toUtf8
        |> List.reverse
        |> List.mapTry octalToDecimal

    Result.try octals \l ->
        List.walkWithIndex l (Ok 0) \resultSum, digit, i ->
            when resultSum is
                Ok sum ->
                    safeMultiply = Num.mulChecked (Num.powInt 8 i) digit
                    newValue = Result.try safeMultiply \x -> Num.addChecked sum x
                    newValue

                Err _ ->
                    resultSum

octalToDecimal = \octal ->
    lower = if octal >= 'A' && octal <= 'Z' then octal + 32 else octal
    when lower is
        '0' -> Ok 0
        '1' -> Ok 1
        '2' -> Ok 2
        '3' -> Ok 3
        '4' -> Ok 4
        '5' -> Ok 5
        '6' -> Ok 6
        '7' -> Ok 7
        _ -> Err NotHex
