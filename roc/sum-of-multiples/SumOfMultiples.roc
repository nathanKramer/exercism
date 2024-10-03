module [sumOfMultiples]

sumOfMultiples : List U64, U64 -> U64
sumOfMultiples = \factors, limit ->
    allMultiples = List.joinMap factors (\factor -> multiplesLessThan factor limit)
    allMultiples |> Set.fromList |> Set.toList |> List.sum

multiplesLessThan = \factor, limit ->
    if factor == 0 then
        [0]
        else

    List.range { start: At factor, end: Before limit, step: factor }
