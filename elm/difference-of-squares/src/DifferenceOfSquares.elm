module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)

import List exposing (foldl, map, range)


sum : List Int -> Int
sum =
    foldl (+) 0


squared : Int -> Int
squared x =
    x ^ 2


squareOfSum : Int -> Int
squareOfSum n =
    sum (range 1 n) ^ 2


sumOfSquares : Int -> Int
sumOfSquares n =
    range 1 n
        |> map squared
        |> sum


difference : Int -> Int
difference n =
    squareOfSum n - sumOfSquares n
