module [isPaired]

isPaired : Str -> Bool
isPaired = \string ->
    chars =
        string
        |> Str.toUtf8
        |> List.keepIf isBracket

    bracketStack = List.walkTry chars [] \stack, char ->
        when (stack, char) is
            (_, '{') -> Ok (List.append stack '{')
            (_, '[') -> Ok (List.append stack '[')
            (_, '(') -> Ok (List.append stack '(')
            ([.. as rest, '{'], '}') -> Ok rest
            ([.. as rest, '['], ']') -> Ok rest
            ([.. as rest, '('], ')') -> Ok rest
            (_, ')') -> Err Unbalanced
            (_, ']') -> Err Unbalanced
            (_, '}') -> Err Unbalanced
            _ -> Ok stack

    when bracketStack is
        Ok [] -> Bool.true
        _ -> Bool.false

isBracket = \c ->
    set = Set.fromList ['{', '}', '(', ')', '[', ']']
    Set.contains set c
