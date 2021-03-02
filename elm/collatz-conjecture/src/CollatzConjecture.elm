module CollatzConjecture exposing (collatz)


countCollatzSteps : Int -> Int -> Int
countCollatzSteps steps n =
    let
        val =
            if modBy 2 n == 0 then
                n // 2

            else
                (3 * n) + 1
    in
    if n == 1 then
        steps

    else
        countCollatzSteps (steps + 1) val


collatz : Int -> Result String Int
collatz start =
    if start <= 0 then
        Result.Err "Only positive numbers are allowed"

    else
        Result.Ok <| countCollatzSteps 0 start
