module [truncate]

import unicode.CodePoint

truncate : Str -> Result Str _
truncate = \input ->
    codepoints =
        input
            |> Str.toUtf8
            |> CodePoint.parseUtf8?
    codepoints |> List.takeFirst 5 |> CodePoint.toStr? |> Ok

