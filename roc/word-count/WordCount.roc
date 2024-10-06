module [countWords]

countWords : Str -> Dict Str U64
countWords = \sentence ->
    sentence
    |> Str.replaceEach "," " "
    |> Str.split " "
    |> List.map sanitizeWord
    |> List.dropIf Str.isEmpty
    |> List.walk (Dict.empty {}) \dict, word ->
        Dict.update dict word \result ->
            when result is
                Ok existing -> Ok (existing + 1)
                Err Missing -> Ok 1

sanitizeWord : Str -> Str
sanitizeWord = \word ->
    word
    |> Str.trim
    |> Str.dropPrefix "'"
    |> Str.dropSuffix "'"
    |> Str.toUtf8
    |> List.map \char -> if char >= 'A' && char <= 'Z' then char + 32 else char
    |> List.keepIf \char -> (char >= 'a' && char <= 'z') || (char >= '0' && char <= '9') || char == '\''
    |> Str.fromUtf8
    |> Result.withDefault ""
