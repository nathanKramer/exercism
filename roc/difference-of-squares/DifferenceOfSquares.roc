module [squareOfSum, sumOfSquares, differenceOfSquares]

# squareOfSum : U64 -> U64
# squareOfSum = \number ->
#     loop =
#         \sum ->
#             if sum == number then
#                 sum
#             else
#                 sum + loop (sum + 1)
#     summation = loop 1
#     Num.powInt summation 2

squareOfSum : U64 -> U64
squareOfSum = \number ->
    List.sum (List.range { start: At 1, end: At number }) |> Num.powInt 2

sumOfSquares : U64 -> U64
sumOfSquares = \number ->
    List.map
        (List.range { start: At 1, end: At number })
        \n -> n * n
    |> List.sum

differenceOfSquares : U64 -> U64
differenceOfSquares = \number ->
    squareOfSum number - sumOfSquares number
