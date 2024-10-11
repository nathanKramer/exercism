module [encode, decode]

encode : Str -> Result Str _
encode = \phrase ->
    phrase
    |> Str.toUtf8
    |> List.keepIf isAlphaNumeric
    |> List.map toLower
    |> List.chunksOf 5
    |> List.walkTry [] \sentence, chunk ->
        encoded = encodeChunk chunk
        Result.map (Str.fromUtf8 encoded) \encodedChunk ->
            List.append sentence encodedChunk
    |> Result.map \l -> Str.joinWith l " "

encodeChunk : List U8 -> List U8
encodeChunk = \chunk ->
    reversedAlphabet = List.reverse alphabet
    List.keepOks chunk \c ->
        if isNumeric c then
            Ok c
        else
            idx = List.findFirstIndex? alphabet (\el -> c == el)
            List.get reversedAlphabet idx

decode : Str -> Result Str _
decode = \phrase ->
    reversedAlphabet = List.reverse alphabet
    phrase
        |> Str.toUtf8
        |> List.keepIf isAlphaNumeric
        |> List.keepOks \c ->
            if isNumeric c then
                Ok c
            else
                idx = List.findFirstIndex? reversedAlphabet (\el -> c == el)
                List.get alphabet idx
        |> Str.fromUtf8

alphabet = Str.toUtf8 "abcdefghijklmnopqrstuvwxyz"

toLower = \c -> if c >= 'A' && c <= 'Z' then c + 32 else c

isAlphaNumeric = \c ->
    lowered = toLower c
    (lowered >= 'a' && lowered <= 'z') || isNumeric lowered

isNumeric = \c -> (c >= '0' && c <= '9')
