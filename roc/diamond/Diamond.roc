module [diamond]

diamond : U8 -> Str
diamond = \letter ->
    midPoint = Num.toU64 letter - 'A'
    width = Num.toU64 ((Num.toU64 midPoint) * 2) + 1

    topHalf = List.range { start: At 'A', end: At letter }
    bottomHalf = List.range { start: At 'A', end: Before letter }

    generateRow = \char ->
        charStr = Result.withDefault (Str.fromUtf8 [char]) ""
        row = List.repeat " " width
        offsetFromMiddle = Num.toU64 char - Num.toU64 'A'
        (pos1, pos2) = (midPoint - offsetFromMiddle, midPoint + offsetFromMiddle)

        row
        |> List.set pos1 charStr
        |> List.set pos2 charStr
        |> Str.joinWith ""

    rows = List.concat (List.map topHalf generateRow) (List.reverse (List.map bottomHalf generateRow))

    Str.joinWith rows "\n"
