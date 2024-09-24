module Allergies exposing (Allergy(..), isAllergicTo, toList)

import Bitwise as B


type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


allergies : List Allergy
allergies =
    [ Eggs
    , Peanuts
    , Shellfish
    , Strawberries
    , Tomatoes
    , Chocolate
    , Pollen
    , Cats
    ]


allergyValue : Allergy -> Int
allergyValue allergy =
    case allergy of
        Eggs ->
            1

        Peanuts ->
            2

        Shellfish ->
            4

        Strawberries ->
            8

        Tomatoes ->
            16

        Chocolate ->
            32

        Pollen ->
            64

        Cats ->
            128


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    let
        allergyTest =
            B.and (allergyValue allergy) score
    in
    case allergyTest of
        0 ->
            False

        _ ->
            True


toList : Int -> List Allergy
toList score =
    List.filter (\allergy -> isAllergicTo allergy score) allergies
