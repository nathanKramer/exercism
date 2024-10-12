module [keep, discard]

keep : List a, (a -> Bool) -> List a
keep = \list, predicate ->
    when list is
        [] -> list
        [head, .. as rest] ->
            if predicate head then
                keep rest predicate
                |>
                List.prepend head
            else
                keep rest predicate

discard : List a, (a -> Bool) -> List a
discard = \list, predicate ->
    keep list \elem -> !(predicate elem)
