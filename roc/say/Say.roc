module [say]

translations = Dict.fromList [
    (1, "one"),
    (2, "two"),
    (3, "three"),
    (4, "four"),
    (5, "five"),
    (6, "six"),
    (7, "seven"),
    (8, "eight"),
    (9, "nine"),
    (10, "ten"),
    (11, "eleven"),
    (12, "twelve"),
    (13, "thirteen"),
    (14, "fourteen"),
    (15, "fifteen"),
    (16, "sixteen"),
    (17, "seventeen"),
    (18, "eighteen"),
    (19, "nineteen"),
    (20, "twenty"),
    (30, "thirty"),
    (40, "forty"),
    (50, "fifty"),
    (60, "sixty"),
    (70, "seventy"),
    (80, "eighty"),
    (90, "ninety"),
]

magnitudes = [
    (1_000_000_000, "billion"),
    (1_000_000, "million"),
    (1_000, "thousand"),
    (100, "hundred"),
]

sayCompoundWord : U64 -> Str
sayCompoundWord = \number ->
    small = number % 10
    big = number - small
    List.keepOks [big, small] \n -> Dict.get translations n
    |> Str.joinWith ("-")

say : U64 -> Result Str _
say = \number ->
    if number == 0 then
        Ok "zero"
        else

    sayInternal = \n ->
        if n > 999_999_999_999 then
            Err OutOfRange
        else if Dict.contains translations n then
            Dict.get translations n
        else if n < 100 then
            Ok (sayCompoundWord n)
        else
            (magnitude, magnitudeWord) =
                magnitudes
                |> List.dropIf \(m, _) -> m > n
                |> List.first
                |> Result.withDefault (0, "Unreachable")

            quantity = (n // magnitude)

            remainder = n % magnitude

            components = [
                sayInternal quantity,
                Ok magnitudeWord,
                sayInternal remainder,
            ]

            filtered =
                components
                |> List.keepOks \identity -> identity
                |> List.dropIf Str.isEmpty

            Ok (Str.joinWith filtered " ")

    sayInternal number
