(ns isbn-verifier
  (:require [clojure.string :as str]))

(defn sanitize-isbn [isbn]
  (let [lowered (str/lower-case isbn)
        sanitized (remove #(= \- %)
                          (butlast lowered))]
    (concat sanitized [(last lowered)])))

(defn parse-isbn [sanitized]
  (map (fn [c] (if (= \x c)
                 10
                 (Character/digit c 10))) sanitized))

(defn verify-isbn [parsed-isbn]
  (let [len (count parsed-isbn)
        formula-result (->> (range 0 len)
                            (map
                             (fn [i] (nth parsed-isbn i) * (- len i)))
                            (reduce +))]
    (= 0 (mod formula-result 11))))

(defn isbn? [isbn]
  (let [sanitized (sanitize-isbn isbn)
        valid-length? (= 10 (count sanitized))
        valid-structure? (every? #(Character/isDigit %) (take 9 sanitized))
        valid-check-digit? (let [check-digit (last sanitized)]
                             (or (= \x check-digit) (Character/isDigit check-digit)))
        valid-input? (and valid-length? valid-structure? valid-check-digit?)
        parsed (parse-isbn sanitized)]
    (and valid-input? (verify-isbn parsed))))


(isbn? "3-598-21507-X")
