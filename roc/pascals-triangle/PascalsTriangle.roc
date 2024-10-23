module [pascalsTriangle]

pascalsTriangle : U64 -> List (List U64)
pascalsTriangle = \count ->
    if count == 0 then
        []
    else if count == 1 then
        [[1]]
        else

    help = \currentRow, triangle ->

        newRow =
            List.range { start: At 0, end: At currentRow }
            |> List.map \idx ->
                previousRow =
                    List.get triangle (currentRow - 1)
                    |> Result.withDefault []
                leftSide =
                    if idx == 0 then Ok 0 else List.get previousRow (idx - 1)

                rightSide = List.get previousRow idx
                leftSideValue = Result.withDefault leftSide 0
                rightSideValue = Result.withDefault rightSide 0

                leftSideValue + rightSideValue
        newTriangle = List.append triangle newRow
        if currentRow == count - 1 then
            newTriangle
        else
            help (currentRow + 1) newTriangle
    help 1 [[1]]
