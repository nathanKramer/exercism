module [nucleotideCounts]

nucleotideCounts : Str -> Result { a : U64, c : U64, g : U64, t : U64 } _
nucleotideCounts = \input ->
    counts = { a: 0, c: 0, g: 0, t: 0 }
    Str.walkUtf8
        input
        (Ok counts)
        \acc, char ->
            when char is
                'A' -> Result.map acc (\sums -> { sums & a: sums.a + 1 })
                'C' -> Result.map acc (\sums -> { sums & c: sums.c + 1 })
                'G' -> Result.map acc (\sums -> { sums & g: sums.g + 1 })
                'T' -> Result.map acc (\sums -> { sums & t: sums.t + 1 })
                _ -> Err InvalidNucleotide

