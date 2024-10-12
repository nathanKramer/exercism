module [rotate]

rotate : Str, U8 -> Str
rotate = \text, shiftKey ->
    text
    |> Str.toUtf8
    |> List.map \c -> rotateChar c shiftKey
    |> Str.fromUtf8
    |> Result.withDefault ""

rotateChar : U8, U8 -> U8
rotateChar = \char, shiftKey ->
    if char >= 'A' && char <= 'Z' then
        (char - 'A' + shiftKey) % 26 + 'A'
    else if char >= 'a' && char <= 'z' then
        (char - 'a' + shiftKey) % 26 + 'a'
    else
        char
