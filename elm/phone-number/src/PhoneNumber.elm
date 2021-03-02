module PhoneNumber exposing (getNumber)


subscriberNumber : Int -> Bool
subscriberNumber n =
    List.member n <| List.range 2 9


parse10Digits : List Int -> Maybe String
parse10Digits digits =
    let
        subscriberN : List Int -> Bool
        subscriberN ns =
            case ns of
                h :: _ ->
                    subscriberNumber h

                [] ->
                    False

        validArea =
            subscriberN digits

        validLocal =
            subscriberN <| List.drop 3 digits

        toStr digitL =
            String.concat <| List.map String.fromInt digitL
    in
    if validArea && validLocal then
        Just <| toStr digits

    else
        Nothing


getNumber : String -> Maybe String
getNumber phoneNumber =
    let
        parseChar c =
            String.toInt <| String.fromList [ c ]

        digits =
            phoneNumber
                |> String.toList
                |> List.filterMap parseChar
    in
    if List.length digits == 11 then
        case digits of
            1 :: remaining ->
                parse10Digits remaining

            _ ->
                Nothing

    else if List.length digits == 10 then
        parse10Digits digits

    else
        Nothing
