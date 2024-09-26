module [accumulate]

accumulate : List a, (a -> b) -> List b
accumulate = \list, func ->
    helper list func []

helper : List a, (a -> b), List b -> List b
helper = \list, fn, acc ->
    when list is
        [] -> acc
        [x, .. as rest] ->
            newAcc = List.append acc (fn x)
            helper rest fn newAcc
