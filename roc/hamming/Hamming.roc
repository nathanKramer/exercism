module [distance]

distance : Str, Str -> Result U64 _
distance = \strand1, strand2 ->
    list1 = Str.toUtf8 strand1
    list2 = Str.toUtf8 strand2

    if List.len list1 != List.len list2 then
        Err InvalidInput
        else

    List.map2 list1 list2 Pair
    |> List.countIf \Pair s1 s2 -> s1 != s2
    |> Ok
