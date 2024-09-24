module Gigasecond exposing (add)

import Time exposing (millisToPosix, posixToMillis)


add : Time.Posix -> Time.Posix
add timestamp =
    (posixToMillis timestamp + 10 ^ 12)
        |> millisToPosix
