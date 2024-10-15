module [saddlePoints]

Forest : List (List U8)
Position : { row : U64, column : U64 }

saddlePoints : Forest -> Set Position
saddlePoints = \treeHeights ->
    tallestInRows = List.walkWithIndex treeHeights [] \tallestTrees, row, rowIndex ->
        tallest = List.max row |> Result.withDefault 0
        tallestPositionsInRow = List.walkWithIndex row [] \tallestTreesInRow, treeHeight, columnIndex ->
            if treeHeight == tallest then
                List.append tallestTreesInRow ({ row: rowIndex + 1, column: columnIndex + 1 })
            else
                tallestTreesInRow
        List.concat tallestTrees tallestPositionsInRow
    tallestInRowsSet = Set.fromList tallestInRows

    columnCount =
        treeHeights
        |> List.first
        |> Result.map \row -> List.len row
        |> Result.withDefault 0

    columns = List.range { start: At 0, end: Before columnCount }

    shortestInColumns =
        List.joinMap columns \columnIndex ->
            column =
                treeHeights
                |>
                List.mapWithIndex \row, rowIdx ->
                    List.get row columnIndex
                    |> Result.map \treeHeight -> { treeHeight, rowIdx }
                |> List.keepOks identity
            shortest = List.map column .treeHeight |> List.min |> Result.withDefault 0

            column
            |> List.keepIf \{ treeHeight } -> treeHeight == shortest
            |> List.map \{ rowIdx } -> { row: rowIdx + 1, column: columnIndex + 1 }

    shortestInColumnsSet = Set.fromList shortestInColumns
    Set.intersection tallestInRowsSet shortestInColumnsSet

identity = \id -> id
