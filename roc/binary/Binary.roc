module [decimal]

b0 = 48
b1 = 49

decimal : Str -> Result U64 _
decimal = \binaryStr ->
    isBinary = List.all (Str.toUtf8 binaryStr) (\c -> c == b0 || c == b1)
    if isBinary then
        Ok (countBinary binaryStr)
    else
        Err "Must provide a binary string"

countBinary : Str -> U64
countBinary = \binaryStr ->
    binaryStr
    |> Str.toUtf8
    |> List.reverse
    |> List.mapWithIndex
        (\byte, i ->
            if byte == b1 then
                Num.powInt 2 i
            else
                0
        )
    |> List.sum
