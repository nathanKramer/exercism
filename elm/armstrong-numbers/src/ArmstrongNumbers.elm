module ArmstrongNumbers exposing (isArmstrongNumber)


isArmstrongNumber : Int -> Bool
isArmstrongNumber num =
    let
        digits =
            String.fromInt num
    in
    digits
        |> String.split ""
        |> List.map
            (String.toInt
                >> Maybe.withDefault 0
                >> (\i -> i ^ String.length digits)
            )
        |> List.foldl (+) 0
        |> (==) num
