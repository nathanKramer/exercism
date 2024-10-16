module [squareRoot]

squareRoot : U64 -> U64
squareRoot = \radicand ->
    if radicand == 1 then
        1
        else

    guess = radicand // 2

    loop : U64 -> U64
    loop = \previousGuess ->
        newGuess =
            (
                previousGuess
                +
                (radicand // previousGuess)
            )
            // 2

        if (newGuess * newGuess) == radicand then
            newGuess
        else
            loop newGuess

    loop guess
