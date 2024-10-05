module [value]

Color : [
    Black,
    Brown,
    Red,
    Orange,
    Yellow,
    Green,
    Blue,
    Violet,
    Grey,
    White,
]

value : Color, Color -> U8
value = \first, second ->
    firstDigit = colors first * 10
    secondDigit = colors second
    firstDigit + secondDigit

colors = \color ->
    when color is
        Black -> 0
        Brown -> 1
        Red -> 2
        Orange -> 3
        Yellow -> 4
        Green -> 5
        Blue -> 6
        Violet -> 7
        Grey -> 8
        White -> 9
