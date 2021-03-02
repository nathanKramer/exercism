module BinarySearch exposing (find)

import Array exposing (Array)


find : Int -> Array Int -> Maybe Int
find target xs =
    let
        len =
            Array.length xs

        index =
            len // 2

        val =
            Array.get index xs
    in
    Maybe.andThen
        (\n ->
            if n == target then
                Just index

            else if len == 1 then
                Nothing

            else if target < n then
                find target (Array.slice 0 index xs)

            else
                Maybe.map ((+) index) <|
                    find
                        target
                        (Array.slice index len xs)
        )
        val
