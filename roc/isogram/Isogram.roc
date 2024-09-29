module [isIsogram]

isIsogram : Str -> Bool
isIsogram = \phrase ->
    sanitized =
        phrase
        |> Str.toUtf8
        |> List.map toLowerCase
        |> List.keepIf isAlpha
    List.len sanitized == Set.fromList sanitized |> Set.len

isAlpha = \char ->
    lower = toLowerCase char
    lower >= 'a' && lower <= 'z'

toLowerCase = \char ->
    when char is
        _ if char >= 'A' && char <= 'Z' -> char + 32
        _ -> char
