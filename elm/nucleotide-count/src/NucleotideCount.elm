module NucleotideCount exposing (nucleotideCounts)


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


nucleotideCounts : String -> NucleotideCounts
nucleotideCounts sequence =
    sequence
        |> String.toLower
        |> String.toList
        |> group
        |> List.foldl aggregateGroups
            (NucleotideCounts 0 0 0 0)


aggregateGroups : ( Char, List Char ) -> NucleotideCounts -> NucleotideCounts
aggregateGroups ( k, instances ) acc =
    let
        count =
            List.length instances
    in
    case k of
        'a' ->
            { acc | a = acc.a }

        't' ->
            { acc | t = acc.t }

        'c' ->
            { acc | c = acc.c }

        'g' ->
            { acc | g = acc.g }

        _ ->
            acc


group : List a -> List ( a, List a )
group list =
    let
        helper : List a -> List ( a, List a ) -> List ( a, List a )
        helper scattered gathered =
            case scattered of
                [] ->
                    List.reverse gathered

                toGather :: population ->
                    let
                        ( gathering, remaining ) =
                            List.partition ((==) toGather) population
                    in
                    helper remaining <| ( toGather, gathering ) :: gathered
    in
    helper list []
