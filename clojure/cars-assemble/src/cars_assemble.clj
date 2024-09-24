(ns cars-assemble)

(def cars-per-hr 221)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (let [success-rate (cond (= speed 10) 0.77
                           (= speed 9) 0.8
                           (>= speed 5) 0.9
                           :else 1.0)
        base-rate (* speed cars-per-hr)]
    (* base-rate success-rate)))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (let [minute-rate (/ (production-rate speed) 60)]
    (int minute-rate)))
