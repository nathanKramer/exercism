(ns binary-search)

(defn middle [coll]
  (quot (count coll) 2))

(defn search-for [item coll]
  (let [idx (middle coll)
        middle-value (nth coll idx)
        not-found-error (Exception. "not found")]
    (cond
      (= item middle-value) idx
      (= 1 (count coll)) (throw not-found-error)
      (< item middle-value) (search-for item (take idx coll))
      :else (+ idx (search-for item (drop idx coll))))))
