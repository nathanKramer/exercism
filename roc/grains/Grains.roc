module [grainsOnSquare, totalGrains]

grainsOnSquare : U8 -> Result U64 _
grainsOnSquare = \square ->
    if square > 0 && square <= 64 then
        Ok (Num.powInt 2 ((Num.toU64 square) - 1))
    else
        Err NotAChessSquare

totalGrains : U64
totalGrains = Num.maxU64
