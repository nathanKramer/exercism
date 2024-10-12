module [toProtein]

AminoAcid : [Cysteine, Leucine, Methionine, Phenylalanine, Serine, Tryptophan, Tyrosine]
Protein : List AminoAcid

toProtein : Str -> Result Protein _
toProtein = \rna ->
    instructions =
        rna
        |> Str.toUtf8
        |> List.chunksOf 3
        |> List.map \l -> Str.fromUtf8 l |> Result.withDefault ""
        |> List.map codonToInstruction

    collectProtein = \protein, codonInstructions ->
        when codonInstructions is
            [] -> Ok protein
            [instruction, .. as rest] ->
                when instruction is
                    Ok (Append aminoAcid) ->
                        appended = List.append protein aminoAcid
                        collectProtein appended rest

                    Ok Stop -> Ok protein
                    Err e -> Err e

    collectProtein [] instructions

Instruction : [Append AminoAcid, Stop]

codonToInstruction : Str -> Result Instruction _
codonToInstruction = \codon ->
    when codon is
        "AUG" -> Ok (Append Methionine)
        "UUU" | "UUC" -> Ok (Append Phenylalanine)
        "UUA" | "UUG" -> Ok (Append Leucine)
        "UCU" | "UCC" | "UCA" | "UCG" -> Ok (Append Serine)
        "UAU" | "UAC" -> Ok (Append Tyrosine)
        "UGU" | "UGC" -> Ok (Append Cysteine)
        "UGG" -> Ok (Append Tryptophan)
        "UAA" | "UAG" | "UGA" -> Ok Stop
        _ -> Err Unknown
