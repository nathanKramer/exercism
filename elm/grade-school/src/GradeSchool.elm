module GradeSchool exposing (addStudent, allStudents, empty, studentsInGrade)

import Dict exposing (Dict)


type alias Grade =
    Int


type alias Student =
    String


type alias School =
    Dict Grade (List Student)


empty : School
empty =
    Dict.empty


addStudent : Grade -> Student -> School -> School
addStudent grade student school =
    let
        updateStudents : Maybe (List Student) -> Maybe (List Student)
        updateStudents v =
            case v of
                Just students ->
                    Just (List.sort (student :: students))

                Nothing ->
                    Just [ student ]
    in
    Dict.update grade updateStudents school


studentsInGrade : Grade -> School -> List Student
studentsInGrade grade school =
    case
        Dict.get grade school
    of
        Just students ->
            students

        Nothing ->
            []


allStudents : School -> List ( Grade, List Student )
allStudents school =
    Dict.toList school
