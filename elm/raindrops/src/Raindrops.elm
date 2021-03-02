module Raindrops exposing (raindrops)


raindrops : Int -> String
raindrops number =
    let
        labelledRaindrops =
            labelFactors number
                [ ( 3, "Pling" )
                , ( 5, "Plang" )
                , ( 7, "Plong" )
                ]
    in
    stringWithDefault (String.fromInt number) labelledRaindrops


labelFactors : Int -> List ( Int, String ) -> String
labelFactors number =
    List.filterMap (labelFactor number) >> String.concat


labelFactor : Int -> ( Int, String ) -> Maybe String
labelFactor num ( factor, label ) =
    if modBy factor num == 0 then
        Just label

    else
        Nothing



-- String.Extra


{-| It would be nice if we had String.withDefault,
The behaviour is the same as Maybe.withDefault, except it uses the default value in the case of the empty string

stringWithDefault "It looks like we have no fruit :(" (String.join ", " fruit)

-}
stringWithDefault : String -> String -> String
stringWithDefault default value =
    Maybe.withDefault default (nonEmpty value)


nonEmpty : String -> Maybe String
nonEmpty string =
    if String.isEmpty string then
        Nothing

    else
        Just string
