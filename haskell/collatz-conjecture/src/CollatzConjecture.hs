module CollatzConjecture (collatz) where

collatz' :: Integer -> Integer
collatz' 1 = 0
collatz' n =
  let next = if even n then quot n 2 else 3 * n + 1
   in succ $ collatz' next

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | otherwise = Just $ collatz' n
