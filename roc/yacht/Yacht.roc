module [score]

Category : [Ones, Twos, Threes, Fours, Fives, Sixes, FullHouse, FourOfAKind, LittleStraight, BigStraight, Choice, Yacht]

score : List U8, Category -> U8
score = \dice, category ->
    when category is
        Ones -> scoreNItems dice 1
        Twos -> scoreNItems dice 2
        Threes -> scoreNItems dice 3
        Fours -> scoreNItems dice 4
        Fives -> scoreNItems dice 5
        Sixes -> scoreNItems dice 6
        FourOfAKind -> scoreFourOfAKind dice
        LittleStraight -> scoreLittleStraight dice
        BigStraight -> scoreBigStraight dice
        FullHouse -> scoreFullHouse dice
        Choice -> List.sum dice
        Yacht -> scoreYacht dice

scoreNItems : List U8, U8 -> U8
scoreNItems = \items, n ->
    Num.toU8 (List.countIf items \item -> item == n) * n

scoreLittleStraight : List U8 -> U8
scoreLittleStraight = \dice ->
    required = Set.fromList [1, 2, 3, 4, 5]
    if Set.fromList dice == required then
        30
    else
        0

scoreBigStraight : List U8 -> U8
scoreBigStraight = \dice ->
    required = Set.fromList [2, 3, 4, 5, 6]
    if Set.fromList dice == required then
        30
    else
        0

scoreFullHouse : List U8 -> U8
scoreFullHouse = \dice ->
    counts = getCounts dice
    if Set.fromList (Dict.values counts) == Set.fromList [2, 3] then
        List.sum dice
    else
        0

scoreFourOfAKind : List U8 -> U8
scoreFourOfAKind = \dice ->
    counts = getCounts dice
    Dict.walk counts 0 \total, cast, occurrences ->
        if occurrences >= 4 then total + (cast * 4) else total

scoreYacht : List U8 -> U8
scoreYacht = \dice ->
    counts = getCounts dice
    if Dict.values counts == [5] then
        50
    else
        0

getCounts = \dice ->
    List.walk dice (Dict.empty {}) \dict, cast ->
        Dict.update dict cast \possibleCount ->
            when possibleCount is
                Ok x -> Ok (x + 1)
                Err Missing -> Ok 1
