module RNATranscription exposing (toRNA)


nucleotideComplement : Char -> Char
nucleotideComplement n =
    case n of
        'A' ->
            'U'

        'C' ->
            'G'

        'T' ->
            'A'

        'G' ->
            'C'

        _ ->
            ' '


toRNA : String -> Result Char String
toRNA dna =
    Ok
        (String.toList dna
            |> List.map nucleotideComplement
            |> String.fromList
        )
