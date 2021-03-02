(ns say
  (:require [clojure.string :refer [join]]))

(def translations {1 "one"
                   2 "two"
                   3 "three"
                   4 "four"
                   5 "five"
                   6 "six"
                   7 "seven"
                   8 "eight"
                   9 "nine"
                   10 "ten"
                   11 "eleven"
                   12 "twelve"
                   13 "thirteen"
                   14 "fourteen"
                   15 "fifteen"
                   16 "sixteen"
                   17 "seventeen"
                   18 "eighteen"
                   19 "nineteen"
                   20 "twenty"
                   30 "thirty"
                   40 "forty"
                   50 "fifty"
                   60 "sixty"
                   70 "seventy"
                   80 "eighty"
                   90 "ninety"})

(def magnitudes
  [[1000000000 "billion"]
   [1000000    "million"]
   [1000       "thousand"]
   [100        "hundred"]])

(defn- next-magnitude
  [num]
  (first
   (drop-while
    (fn [[val _]] (> val num))
    magnitudes)))

(defn- say-compound-word
  [num]
  (let [small (rem num 10)
        big (- num small)
        components (filter not-empty (map translations [big small]))]
    (join "-" components)))

(defn- say
  [num]
  (cond
    (contains? translations num) (translations num)
    (< num 100) (say-compound-word num)
    :else (let [[magnitude magnitude-word] (next-magnitude num)
                quantity (long (/ num magnitude))
                remainder (rem num magnitude)
                components [(say quantity) magnitude-word (say remainder)]
                filtered-components (filter
                                     not-empty
                                     components)]
            (join " " filtered-components))))


;;; EXPORTS


;;; Translate a number in the range 0-999999999999 to english
(defn number
  [num]
  {:pre  [(>= num 0)
          (< num 999999999999)]}
  (if (= num 0)
    "zero"
    (say num)))
