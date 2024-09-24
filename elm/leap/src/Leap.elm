module Leap exposing (isLeapYear)


divisbleBy : Int -> Int -> Bool
divisbleBy div x =
    modBy div x == 0


isLeapYear : Int -> Bool
isLeapYear year =
    List.all
        (\fn -> fn year)
        [ divisbleBy 4
        , fOr (divisbleBy 100 >> not) (divisbleBy 400)
        ]


fOr f g x =
    f x || g x
