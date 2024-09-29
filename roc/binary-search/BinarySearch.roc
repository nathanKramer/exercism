module [find]

find : List U64, U64 -> Result U64 _
find = \array, target ->
    when array is
        [] -> Err NotPresent
        [only] -> if only == target then Ok 0 else Err NotPresent
        items ->
            pivot = List.len items // 2
            guess = List.get items pivot

            when guess is
                Ok x if x == target ->
                    Ok pivot

                Ok x if x > target ->
                    cutoff = List.len items - pivot
                    xs = List.dropLast items cutoff
                    find xs target

                Ok _ ->
                    xs = List.dropFirst items pivot
                    Result.map (find xs target) (\i -> i + pivot)

                Err OutOfBounds -> crash "The pivot point $(Num.toStr pivot) should never be out of bounds for list of length $(Num.toStr (List.len array))."

