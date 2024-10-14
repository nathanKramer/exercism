module [create, rank, file, queenCanAttack]

Square := { row : U8, column : U8 }

rank : Square -> U8
rank = \@Square { row } -> 8 - row

file : Square -> U8
file = \@Square { column } -> column + 'A'

create : Str -> Result Square [InvalidSquare]
create = \squareStr ->
    chars = Str.toUtf8 squareStr
    fileResult = List.get chars 0
    rankResult = List.get chars 1
    Result.map2 fileResult rankResult \fileChar, rankChar -> (fileChar, rankChar)
    |> Result.mapErr \OutOfBounds -> InvalidSquare
    |> Result.try \(fileChar, rankChar) ->
        column = fileChar - 'A'
        if rankChar < '1' || rankChar > '8' then
            Err InvalidSquare
        else if fileChar < 'A' || fileChar > 'H' then
            Err InvalidSquare
        else
            Ok (@Square { row: rankToRow rankChar, column })

queenCanAttack : Square, Square -> Bool
queenCanAttack = \@Square { row: row1, column: col1 }, @Square { row: row2, column: col2 } ->
    row1Signed = Num.toI32 row1
    row2Signed = Num.toI32 row2
    col1Signed = Num.toI32 col1
    col2Signed = Num.toI32 col2
    row1 == row2 || col1 == col2 || (Num.abs (row1Signed - row2Signed)) == (Num.abs (col1Signed - col2Signed))

rankToRow : U8 -> U8
rankToRow = \rankChar ->
    8 - (rankChar - '0')
