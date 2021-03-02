(ns roman-numerals)

(def romans [[1000 "M"]
             [900 "CM"]
             [500 "D"]
             [400 "CD"]
             [100 "C"]
             [90 "XC"]
             [50 "L"]
             [40 "XL"]
             [10 "X"]
             [9 "IX"]
             [5 "V"]
             [4 "IV"]
             [1 "I"]])

(defn numerals [n]
  (loop [result []
         remaining n
         [[n roman] & rst] romans]
    (if (zero? remaining)
      (apply str result)
      (if (>= remaining n)
        (recur (conj result roman) (- remaining n) romans)
        (recur result remaining rst)))))
