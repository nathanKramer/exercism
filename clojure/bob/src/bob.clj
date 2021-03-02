(ns bob
  (:require [clojure.string :refer [blank? ends-with? trim]]))

(defn is-question [s]
  (ends-with? s "?"))

(defn is-yelling [s]
  (let [alphas (filter #(Character/isLetter %) s)]
    (and
     (not-empty alphas)
     (every?
      #(Character/isUpperCase %)
      alphas))))

(defn response-for
  [input]
  (let [s (trim input)]
    (cond
      (blank? s) "Fine. Be that way!"
      (and (is-yelling s) (is-question s)) "Calm down, I know what I'm doing!"
      (is-question s) "Sure."
      (is-yelling s) "Whoa, chill out!"
      :else "Whatever.")))
