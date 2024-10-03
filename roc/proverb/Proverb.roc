module [recite]

recite : List Str -> Str
recite = \strings ->
    loop = \idx, acc ->
        catalyst = Result.withDefault (List.first strings) ""
        words = List.sublist strings { start: idx, len: 2 }

        newLine =
            when words is
                [a, b] -> "For want of a $(a) the $(b) was lost."
                [_] -> "And all for the want of a $(catalyst)."
                _ -> ""

        proverb = List.append acc newLine

        if idx + 1 < List.len strings then
            loop (idx + 1) proverb
        else
            proverb

    Str.joinWith (loop 0 []) "\n"
