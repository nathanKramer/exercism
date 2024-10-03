module [reverse]

import unicode.Grapheme

reverse : Str -> Str
reverse = \string ->
    when Grapheme.split string is
        Ok chars ->
            chars |> List.reverse |> Str.joinWith ""

        Err _ -> ""
