(ns collatz-conjecture)

(defn- next-collatz-num [num]
  (if
   (even? num)
    (/ num 2)
    (+ 1 (* num 3))))

(defn- collatz-support [step-count num]
  (cond
    (= num 1) step-count
    :else (let [next-num (next-collatz-num num)]
            (collatz-support (+ 1 step-count) next-num))))

(defn collatz [num]
  {:pre [(< 0 num)]}
  (collatz-support 0 num))
