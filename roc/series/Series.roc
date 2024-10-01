module [slices]

slices : Str, U64 -> List Str
slices = \string, sliceLength ->
    utf8 = Str.toUtf8 string

    walk = \acc, _, idx ->
        bytes = List.sublist utf8 { start: idx, len: sliceLength }
        substr = Str.fromUtf8 bytes

        if (List.len bytes) == sliceLength then
            when substr is
                Ok s -> List.append acc s
                Err _ -> acc
        else
            acc

    if sliceLength > 0 then
        Str.walkUtf8WithIndex string [] walk
    else
        []

