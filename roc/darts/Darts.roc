module [score]

score : F64, F64 -> U64
score = \x, y ->
    r = Num.sqrt (x ^ 2 + y ^ 2)

    when r is
        _ if r <= 1 -> 10
        _ if r <= 5 -> 5
        _ if r <= 10 -> 1
        _ -> 0

