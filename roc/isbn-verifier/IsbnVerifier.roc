module [isValid]

isValid : Str -> Bool
isValid = \isbn ->
    sanitized =
        isbn
        |> Str.toUtf8
        |> List.dropIf \c -> c == '-'

    if List.len sanitized != 10 then
        Bool.false
        else

    checkDigit =
        sanitized
        |> List.last
        |> Result.map \c -> if c == 'X' then 10 else c - '0'

    digits =
        sanitized
        |> List.dropLast 1
        |> List.keepIf isDigit
        |> List.map \c -> c - '0'
        |> List.appendIfOk checkDigit

    checkSum = List.walkWithIndex digits (Num.toU64 0) \state, digit, idx ->
        multiplier = 10 - idx
        state + ((Num.toU64 digit) * multiplier)

    checkSum % 11 == 0

isDigit = \c -> c >= '0' && c <= '9'
