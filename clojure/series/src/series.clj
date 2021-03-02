(ns series)

(defn slices [s slice-length]
  (let [sliceable (> slice-length 0)
        sliced (map
                #(apply str %)
                (partition slice-length 1 s))]
    (if sliceable sliced [""])))

