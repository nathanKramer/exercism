module [real, imaginary, add, sub, mul, div, conjugate, abs, exp]

Complex : { re : F64, im : F64 }

real : Complex -> F64
real = \{ re } -> re

imaginary : Complex -> F64
imaginary = \{ im } -> im

add : Complex, Complex -> Complex
add = \{ re: a, im: b }, { re: c, im: d } -> { re: a + c, im: b + d }

sub : Complex, Complex -> Complex
sub = \{ re: a, im: b }, { re: c, im: d } -> { re: a - c, im: b - d }

mul : Complex, Complex -> Complex
mul = \{ re: a, im: b }, { re: c, im: d } -> { re: a * c - b * d, im: b * c + a * d }

div : Complex, Complex -> Complex
div = \{ re: a, im: b }, { re: c, im: d } -> {
    re: (a * c + b * d) / (c ^ 2 + d ^ 2),
    im: (b * c - a * d) / (c ^ 2 + d ^ 2),
}

conjugate : Complex -> Complex
conjugate = \{ re: a, im: b } -> { re: a, im: -b }

abs : Complex -> F64
abs = \{ re: a, im: b } -> Num.sqrt (a * a + b * b)

exp : Complex -> Complex
exp = \{ re: a, im: b } ->
    ea = Num.e |> Num.pow a
    { re: ea * Num.cos b, im: ea * Num.sin b }
