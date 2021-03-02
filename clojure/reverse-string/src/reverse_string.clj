(ns reverse-string)

(defn reverse-string [s]
  (let [reversed-chars (into () s)] ;; https://clojuredocs.org/clojure.core/into
  (apply str reversed-chars)))
