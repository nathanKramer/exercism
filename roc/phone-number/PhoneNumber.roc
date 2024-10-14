module [clean]

clean : Str -> Result Str _
clean = \phoneNumber ->
    phoneNumber
    |> Str.toUtf8
    |> List.keepIf \c -> c >= '0' && c <= '9'
    |> validateLength
    |> Result.try validateAreaCode
    |> Result.try validateExchangeCode
    |> Result.try Str.fromUtf8

validateAreaCode : List U8 -> Result (List U8) _
validateAreaCode = \phoneNumberBytes ->
    when phoneNumberBytes is
        [head, ..] if head >= '2' && head <= '9' -> Ok phoneNumberBytes
        _ ->
            Err Invalid

validateExchangeCode : List U8 -> Result (List U8) _
validateExchangeCode = \phoneNumberBytes ->
    exchangeCode = List.get phoneNumberBytes 3
    when exchangeCode is
        Ok value if value >= '2' && value <= '9' -> Ok phoneNumberBytes
        _ -> Err Invalid

validateLength : List U8 -> Result (List U8) _
validateLength = \phoneNumberBytes ->
    len = List.len phoneNumberBytes
    if len == 10 then
        Ok phoneNumberBytes
    else if len == 11 then
        when phoneNumberBytes is
            [first, .. as rest] if first == '1' -> Ok rest
            _ -> Err Invalid
    else
        Err Invalid
