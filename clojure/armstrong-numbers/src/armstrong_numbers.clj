(ns armstrong-numbers)

(defn digits [num]
  (map #(Character/digit % 10) (str num)))

(defn expt [x n]
  (reduce * (repeat n x)))

(defn armstrong? [n]
  (= n
    (reduce +
      (map
        (fn [x] (expt x (count (str n))))
        (digits n)))))
