module [findAnagrams]

import unicode.Grapheme

findAnagrams : Str, List Str -> List Str
findAnagrams = \subject, candidates ->
    List.walk
        candidates
        []
        \acc, candidate ->
            if isAnagram subject candidate then
                List.append acc candidate
            else
                acc

isAnagram = \word, candidate ->
    wordLower = toLowerCase word
    candidateLower = toLowerCase candidate
    if wordLower == candidateLower then
        Bool.false
    else
        charOccurrences wordLower == charOccurrences candidateLower

charOccurrences = \word ->
    graphemes = Grapheme.split word |> Result.withDefault []
    List.walk
        graphemes
        (Dict.empty {})
        (\acc, grapheme ->
            value = Dict.get acc grapheme |> Result.withDefault 0
            Dict.insert acc grapheme (value + 1)
        )

toLowerCase = \word ->
    word
    |> Str.toUtf8
    |> List.map toLower
    |> Str.fromUtf8
    |> Result.withDefault ""

toLower = \byte ->
    if byte >= 'A' && byte <= 'Z' then byte + 32 else byte
