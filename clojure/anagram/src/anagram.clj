(ns anagram
  (:require [clojure.string :refer [lower-case]]))

(defn is-anagram? [word1 word2]
  (let [w1 (lower-case word1)
        w2 (lower-case word2)
        different-words? (not= w1 w2)
        anagrams? (= (sort w1) (sort w2))]
    (and
     different-words?
     anagrams?)))

(defn anagrams-for [word prospect-list]
  (filter #(is-anagram? word %) prospect-list))
