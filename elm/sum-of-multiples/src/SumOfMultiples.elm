module SumOfMultiples exposing (sumOfMultiples)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
    let
        nums =
            List.range 1 (limit - 1)

        isDivisibleBy divs i =
            List.any (\d -> modBy d i == 0) divs
    in
    nums
        |> List.filter (isDivisibleBy divisors)
        |> List.foldl (+) 0
