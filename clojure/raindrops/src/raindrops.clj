(ns raindrops)

(defn- substitute-factors-with [n substitutions]
  (let [factors (sort (keys substitutions))
        converted (map
                   (fn [factor]
                     (if (= 0 (mod n factor))
                       (get substitutions factor)
                       ""))
                   factors)
        s (apply str converted)]
    (if (empty? s)
      (str n)
      s)))

(defn convert [n]
  (substitute-factors-with n {3 "Pling"
                              5 "Plang"
                              7 "Plong"}))
