open Base

type nucleotide = A | C | G | T

let hamming_distance a b =
  match List.zip a b with
  | [] -> 0
  | [ ([ (x :: xs) ] :: rest) ] -> 1 + hamming_distance rest
