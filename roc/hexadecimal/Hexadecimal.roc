module [parse]

parse : Str -> Result U64 _
parse = \string ->
    if string == "" then
        Err Empty
        else

    hexadecimals =
        string
        |> Str.toUtf8
        |> List.reverse
        |> List.mapTry hexByteToDecimal

    Result.map hexadecimals \l ->
        List.walkWithIndex l 0 \sum, digit, i ->
            sum + ((Num.powInt 16 i) * digit)

hexByteToDecimal = \hex ->
    lower = if hex >= 'A' && hex <= 'Z' then hex + 32 else hex
    when lower is
        '0' -> Ok 0
        '1' -> Ok 1
        '2' -> Ok 2
        '3' -> Ok 3
        '4' -> Ok 4
        '5' -> Ok 5
        '6' -> Ok 6
        '7' -> Ok 7
        '8' -> Ok 8
        '9' -> Ok 9
        'a' -> Ok 10
        'b' -> Ok 11
        'c' -> Ok 12
        'd' -> Ok 13
        'e' -> Ok 14
        'f' -> Ok 15
        _ -> Err NotHex
