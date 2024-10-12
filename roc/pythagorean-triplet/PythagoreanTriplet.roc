module [tripletsWithSum]

Triplet : (U64, U64, U64)

tripletsWithSum : U64 -> Set Triplet
tripletsWithSum = \n ->
    possibleAValues = List.range { start: At 1, end: At (n // 3) }
    possibleAValues
    |> List.walk (Set.empty {}) \triplets, a ->
        # Calculate values of B and C.
        # I asked Claude how to do this because I was stuck :/
        b = (n * (n - 2 * a)) // (2 * (n - a))
        c = n - a - b

        # Check if it's a valid Pythagorean triplet
        if a * a + b * b == c * c && a < b && b < c then
            Set.insert triplets (a, b, c)
        else
            triplets
