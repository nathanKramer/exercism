module [plants]

Student : [Alice, Bob, Charlie, David, Eve, Fred, Ginny, Harriet, Ileana, Joseph, Kincaid, Larry]
Plant : [Grass, Clover, Radishes, Violets]

plants : Str, Student -> Result (List Plant) _
plants = \diagram, student ->
    rows = Str.split diagram "\n"
    (row1Result, row2Result) = (List.get rows 0, List.get rows 1)
    plantResult = Result.map2
        row1Result
        row2Result
        \row1Str, row2Str ->
            idx = studentNumber student * plantsPerStudent

            row1 = Str.toUtf8 row1Str |> List.dropFirst idx
            row2 = Str.toUtf8 row2Str |> List.dropFirst idx

            plantsFromRow1 = List.takeFirst row1 plantsPerStudent
            plantsFromRow2 = List.takeFirst row2 plantsPerStudent

            List.concat plantsFromRow1 plantsFromRow2
    Result.map plantResult \result -> List.keepOks result toPlant

toPlant = \plantStr ->
    when plantStr is
        'V' -> Ok Violets
        'R' -> Ok Radishes
        'C' -> Ok Clover
        'G' -> Ok Grass
        _ -> Err UnsupportedPlant

plantsPerStudent = 2

studentNumber = \student ->
    when student is
        Alice -> 0
        Bob -> 1
        Charlie -> 2
        David -> 3
        Eve -> 4
        Fred -> 5
        Ginny -> 6
        Harriet -> 7
        Ileana -> 8
        Joseph -> 9
        Kincaid -> 10
        Larry -> 11
