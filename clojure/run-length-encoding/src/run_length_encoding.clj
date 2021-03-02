(ns run-length-encoding)

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (apply str (map (fn [chars]
                    (if (= (count chars) 1)
                      (apply str chars)
                      (str (count chars) (first chars))))
                  (partition-by identity plain-text))))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (let [grouped (partition-by #(Character/isDigit %) cipher-text)
        digit-char-pairs (partition 2 grouped)
        encoded? (< 2 (count digit-char-pairs))
        decode (apply str
                      (map (fn [[digits [c & cs]]]
                             (let [n (Integer/parseInt (apply str digits))]
                               (apply str
                                      (flatten (cons (repeat n c) cs)))))
                           digit-char-pairs))]
    (if encoded?
      decode
      cipher-text)))
