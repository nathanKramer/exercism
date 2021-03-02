module Bob exposing (hey)


hey : String -> String
hey =
    String.trim >> response


response : String -> String
response remark =
    if remark |> String.isEmpty then
        "Fine. Be that way!"

    else if (remark |> isQuestion) && (remark |> isYelling) then
        "Calm down, I know what I'm doing!"

    else if remark |> isQuestion then
        "Sure."

    else if remark |> isYelling then
        "Whoa, chill out!"

    else
        "Whatever."


isQuestion : String -> Bool
isQuestion =
    String.endsWith "?"


isYelling : String -> Bool
isYelling =
    extractSpeech >> anyAndAll isYell


extractSpeech =
    String.words >> filterMapBoolean (String.filter Char.isAlpha)


isYell =
    String.all Char.isUpper


filterMapBoolean f =
    List.filterMap (nonEmpty << f)


anyAndAll =
    predicates
        List.any
        List.all


predicates f g p x =
    f p x && g p x



-- String.Extra


nonEmpty : String -> Maybe String
nonEmpty string =
    if String.isEmpty string then
        Nothing

    else
        Just string
