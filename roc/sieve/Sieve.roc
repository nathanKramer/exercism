module [primes]

primes : U64 -> List U64
primes = \limit ->
    if limit < 2 then
        []
        else

    loop = \primeValues, nonPrimes, current ->
        if current == limit then
            if !(Set.contains nonPrimes current) then
                List.append primeValues current
            else
                primeValues
        else if Set.contains nonPrimes current then
            loop primeValues nonPrimes (current + 1)
        else
            newPrimes = List.append primeValues current
            newNonPrimes =
                nonPrimes
                |> Set.toList
                |> List.concat (multiplesUpTo current limit)
                |> Set.fromList
            loop newPrimes newNonPrimes (current + 1)

    loop [2] (Set.fromList (multiplesUpTo 2 limit)) 2

multiplesUpTo : U64, U64 -> List U64
multiplesUpTo = \current, limit ->
    List.range { start: At current, end: At limit, step: current }
