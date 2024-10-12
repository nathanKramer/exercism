module [ciphertext]

ciphertext : Str -> Result Str _
ciphertext = \text ->
    chars =
        text
        |> Str.toUtf8
        |> List.map \c -> if c >= 'A' && c <= 'Z' then c + 32 else c
        |> List.keepIf \c -> (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9')

    (_, colCount) = findRectangle (List.len chars)

    rows = List.chunksOf chars colCount

    cols = List.range { start: At 0, end: Before colCount }

    encodedChars = List.map cols \colIdx ->
        List.map rows \row ->
            row
            |> List.get colIdx
            |> Result.withDefault ' '

    words =
        List.intersperse encodedChars [' ']
        |> List.join

    Str.fromUtf8 words

findRectangle = \strLength ->
    candidateC =
        strLength
        |> Num.toF32
        |> Num.sqrt
        |> Num.ceiling

    loop = \c ->
        r = Num.ceiling (Num.toFrac strLength / Num.toFrac c)
        if c >= r && c - r <= 1 then
            (r, c)
        else
            loop (c + 1)

    loop candidateC

expect
    result = findRectangle 54
    result == (7, 8)
