module [steps]

steps : U64 -> Result U64 [InvalidInput]
steps = \n ->
    if n < 1 then
        Err InvalidInput
    else
        Ok (collatzCount 0 n)

collatzCount : U64, U64 -> U64
collatzCount = \stepCount, n ->
    val =
        if n % 2 == 0 then
            (n // 2)
        else
            (3 * n + 1)

    if n == 1 then
        stepCount
    else
        collatzCount (stepCount + 1) val
