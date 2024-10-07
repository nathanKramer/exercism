module [isEquilateral, isIsosceles, isScalene]

isEquilateral : (F64, F64, F64) -> Bool
isEquilateral = \(a, b, c) ->
    isTriangle (a, b, c)
    && Num.isApproxEq a b {}
    && Num.isApproxEq b c {}

isIsosceles : (F64, F64, F64) -> Bool
isIsosceles = \(a, b, c) ->
    isTriangle (a, b, c) && (eq a b || eq b c || eq a c)

isScalene : (F64, F64, F64) -> Bool
isScalene = \(a, b, c) ->
    isTriangle (a, b, c) && neq a b && neq b c && neq a c

isTriangle : (F64, F64, F64) -> Bool
isTriangle = \(a, b, c) ->
    (a + b >= c)
    && (b + c >= a)
    && (a + c >= b)
    && List.all [a, b, c] \x -> x > 0

eq : F64, F64 -> Bool
eq = \a, b -> Num.isApproxEq a b {}

neq : F64, F64 -> Bool
neq = \a, b -> !(Num.isApproxEq a b {})
