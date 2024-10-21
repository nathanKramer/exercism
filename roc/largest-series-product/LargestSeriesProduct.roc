module [largestProduct]

largestProduct : Str, U64 -> Result U64 _
largestProduct = \digitsStr, span ->
    digits = Str.toUtf8 digitsStr
    if span > List.len digits then
        Err InvalidSpanLength
    else if List.any digits nonDigit then
        Err InvalidDigit
    else if span == 0 then
        Ok 1 # Not sure why we would return 1 here but it's what the tests want so OK.
        else

    help = \n, currentLargest ->
        withoutFirstN = List.dropFirst digits n
        nextSpan = List.takeFirst withoutFirstN span
        spanDigits = List.map nextSpan toDigit

        if List.len spanDigits < span then
            currentLargest
        else
            product = List.walk spanDigits 1 \p, digit ->
                p * Num.toU64 digit
            newLargest = if product > currentLargest then product else currentLargest

            help (n + 1) newLargest

    Ok (help 0 0)

toDigit = \c -> c - '0'

nonDigit = \c -> !(c >= '0' && c <= '9')
