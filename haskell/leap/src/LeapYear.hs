module LeapYear
  ( isLeapYear
  ) where

bind :: (b -> b -> b) -> (a -> b) -> (a -> b) -> a -> b
bind f a b x = f (a x) (b x)

infixl 5 &&$

(&&$) :: (a -> Bool) -> (a -> Bool) -> a -> Bool
(&&$) = bind (&&)

infixl 5 ||$

(||$) :: (a -> Bool) -> (a -> Bool) -> a -> Bool
(||$) = bind (||)

isLeapYear :: Integer -> Bool
isLeapYear = isDivisibleBy 400 ||$ (isDivisibleBy 4 &&$ not . isDivisibleBy 100)
  where
    isDivisibleBy = (\divisor x -> mod x divisor == 0)
