module [toRna]

toRna : Str -> Str
toRna = \dna ->
    dna
    |> Str.toUtf8
    |> List.map nucleoTideComplement
    |> Str.fromUtf8
    |> Result.withDefault ""

nucleoTideComplement = \n ->
    when n is
        'G' -> 'C'
        'C' -> 'G'
        'T' -> 'A'
        'A' -> 'U'
        _ -> n
