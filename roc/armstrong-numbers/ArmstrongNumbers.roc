module [isArmstrongNumber]

isArmstrongNumber : U64 -> Bool
isArmstrongNumber = \number ->
    digits =
        getDigits number
    digitSum =
        List.walk
            digits
            0
            \sum, digit ->
                pow =
                    Num.powInt digit (List.len digits)
                sum + pow

    digitSum == number

getDigits : U64 -> List U64
getDigits = \number ->
    bytes =
        Num.toStr number
        |> Str.toUtf8
        |> List.map (\byte -> byte - '0')
        |> List.map Num.toU64
    bytes

