module [row, column]

column : Str, U64 -> Result (List I64) _
column = \matrixStr, index ->
    rowCount = List.len (Str.split matrixStr "\n")
    rowIndices = List.range { start: At 1, end: At rowCount }
    theRows = List.keepOks rowIndices \idx -> row matrixStr idx

    walkRows : List I64, List I64 -> List I64
    walkRows = \col, theRow ->
        int = List.get theRow (index - 1)
        when int is
            Ok x -> List.append col x
            Err _ -> col

    colValues = List.walk theRows [] walkRows

    Ok colValues

row : Str, U64 -> Result (List I64) _
row = \matrixStr, index ->
    theRow =
        matrixStr
        |> Str.split "\n"
        |> List.get (index - 1)
    Result.map theRow \rowStr ->
        rowStr
        |> Str.split " "
        |> List.keepOks Str.toI64
