(ns word-count
  (:require [clojure.string :refer [split lower-case]]))

(defn word-count [s]
  (let [words (split (lower-case s) #" ")
        grouped-words (group-by identity words)]
    (zipmap
     (keys grouped-words)
     (map count (vals grouped-words)))))
