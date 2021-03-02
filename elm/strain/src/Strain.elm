module Strain exposing (discard, keep)


keep : (a -> Bool) -> List a -> List a
keep predicate items =
    case items of
        [] ->
            []

        x :: xs ->
            let
                rest =
                    keep predicate xs

                result =
                    if predicate x then
                        x :: rest

                    else
                        rest
            in
            result


discard : (a -> Bool) -> List a -> List a
discard predicate list =
    keep (predicate >> not)
        list
