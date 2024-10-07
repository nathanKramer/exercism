module [allergicTo, set]

Allergen : [Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats]

allergies = [Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats]

allergicTo : Allergen, U64 -> Bool
allergicTo = \allergen, score ->
    mask = Num.bitwiseAnd score (allergyScores allergen)
    mask != 0

set : U64 -> Set Allergen
set = \score ->
    List.keepIf allergies \allergen -> allergicTo allergen score
    |> Set.fromList

allergyScores = \allergen ->
    when allergen is
        Eggs -> 1
        Peanuts -> 2
        Shellfish -> 4
        Strawberries -> 8
        Tomatoes -> 16
        Chocolate -> 32
        Pollen -> 64
        Cats -> 128
