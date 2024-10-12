module [prime]

prime : U64 -> Result U64 _
prime = \number ->
    loop = \primes, current ->
        next = if current == 2 then 3 else current + 2
        if List.len primes == number then
            List.last primes
        else if isPrime current then
            List.append primes current
            |>
            loop next
        else
            loop primes next

    loop [] 2

isPrime : U64 -> Bool
isPrime = \number ->
    if number < 2 then
        Bool.false
    else if number == 2 then
        Bool.true
    else if number % 2 == 0 then
        Bool.false
    else
        top = Num.sqrt (Num.toF32 number) |> Num.floor
        toCheck = List.range { start: At 3, end: At top, step: 2 }
        anyDivisible = List.any toCheck \el -> number % el == 0
        !anyDivisible
