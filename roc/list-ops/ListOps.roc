module [append, concat, filter, length, map, foldl, foldr, reverse]

append : List a, List a -> List a
append = \list1, list2 ->
    when list2 is
        [] -> list1
        [head, .. as tail] -> append (List.append list1 head) tail

concat : List (List a) -> List a
concat = \lists ->
    help = \acc, remaining ->
        when remaining is
            [] -> acc
            [head, .. as tail] -> help (append acc head) tail
    help [] lists

filter : List a, (a -> Bool) -> List a
filter = \list, function ->
    help = \acc, remaining ->
        when remaining is
            [] ->
                acc

            [head, .. as tail] ->
                if function head then
                    help (List.append acc head) tail
                else
                    help acc tail
    help [] list

length : List a -> U64
length = \list ->
    when list is
        [] -> 0
        [_, .. as tail] -> 1 + length tail

map : List a, (a -> b) -> List b
map = \list, function ->
    when list is
        [] ->
            []

        [head, .. as tail] ->
            append [function head] (map tail function)

foldl : List a, b, (b, a -> b) -> b
foldl = \list, initial, function ->
    help = \acc, remaining ->
        when remaining is
            [] -> acc
            [head, .. as tail] ->
                help (function acc head) tail
    help initial list

foldr : List a, b, (b, a -> b) -> b
foldr = \list, initial, function ->
    help = \acc, remaining ->
        when remaining is
            [] -> acc
            [.. as rest, last] ->
                help (function acc last) rest
    help initial list

reverse : List a -> List a
reverse = \list ->
    help = \acc, remaining ->
        when remaining is
            [] -> acc
            [.. as rest, last] -> help (List.append acc last) rest
    help [] list
