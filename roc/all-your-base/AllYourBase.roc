module [rebase]

rebase : { inputBase : U64, outputBase : U64, digits : List U64 } -> Result (List U64) _
rebase = \{ inputBase, outputBase, digits } ->
    if inputBase < 2 then
        Err InvalidBase
    else if outputBase < 2 then
        Err InvalidBase
    else if List.isEmpty digits then
        Ok [0]
    else if List.any digits \digit -> digit >= inputBase then
        Err InvalidDigit
    else
        totalInput =
            digits
            |> List.reverse
            |> List.walkWithIndex 0 \acc, elem, i ->
                digitValue = elem * Num.powInt inputBase i
                acc + digitValue

        Ok (toBase totalInput outputBase)

toBase : U64, U64 -> List U64
toBase = \value, base ->
    if value == 0 then
        [0]
        else

    help = \x, newBase, result ->
        if x == 0 then
            result
        else
            help (x // newBase) newBase (List.append result (x % newBase))
    help value base []
    |> List.reverse
