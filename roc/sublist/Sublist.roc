module [sublist]

sublist : List U8, List U8 -> [Equal, Sublist, Superlist, Unequal]
sublist = \list1, list2 ->
    if list1 == list2 then
        Equal
    else if isSublist list1 list2 then
        Superlist
    else if isSublist list2 list1 then
        Sublist
    else
        Unequal

isSublist = \list1, list2 ->
    List.walkWithIndex
        list1
        Bool.false
        \sublistFound, _, idx ->
            if sublistFound then
                sublistFound
                else

            attemptedSublist = List.sublist list1 { start: idx, len: List.len list2 }

            attemptedSublist == list2

