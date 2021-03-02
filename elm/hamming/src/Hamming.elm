module Hamming exposing (distance)


distance : String -> String -> Result String Int
distance left right =
    if String.length left == String.length right then
        Ok <| calculateDistance left right

    else
        Err "left and right strands must be of equal length"


calculateDistance : String -> String -> Int
calculateDistance left right =
    List.map2 Tuple.pair (String.toList left) (String.toList right)
        |> List.filter (\( a, b ) -> a /= b)
        |> List.length
