module [response]

response : Str -> Str
response = \heyBob ->
    sanitized = Str.trim heyBob
    isQuestion = Str.endsWith sanitized "?"
    isSilence = sanitized == ""
    isYelling = strIsYelling sanitized

    if isSilence then
        "Fine. Be that way!"
    else if isQuestion && isYelling then
        "Calm down, I know what I'm doing!"
    else if isQuestion then
        "Sure."
    else if isYelling then
        "Whoa, chill out!"
    else
        "Whatever."

strIsYelling = \str ->
    alphas = List.keepIf (Str.toUtf8 str) isAlpha
    List.len alphas > 0 && List.all alphas isCapitalLetter

isAlpha : U8 -> Bool
isAlpha = \byte ->
    (byte >= 'a' && byte <= 'z') || isCapitalLetter byte

isCapitalLetter : U8 -> Bool
isCapitalLetter = \byte ->
    byte >= 'A' && byte <= 'Z'
