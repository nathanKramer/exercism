module [latest, personalBest, personalTopThree]

Score : U64

latest : List Score -> Result Score _
latest = List.last

personalBest : List Score -> Result Score _
personalBest = List.max

personalTopThree : List Score -> List Score
personalTopThree = \scores ->
    scores
    |> List.sortDesc
    |> List.takeFirst 3
