module Triangle exposing (Triangle(..), triangleKind)


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : number -> number -> number -> Result String Triangle
triangleKind x y z =
    let
        validLength n =
            n > 0

        validLengths =
            List.all validLength [ x, y, z ]

        triangleInequality =
            (x + y > z)
                && (y + z > x)
                && (z + x > y)

        classification =
            if x == y && x == z && y == z then
                Ok Equilateral

            else if x == y || x == z || y == z then
                Ok Isosceles

            else
                Ok Scalene
    in
    if not validLengths then
        Err "Invalid lengths"

    else if not triangleInequality then
        Err "Violates inequality"

    else
        classification
