;; Given a DNA strand, return its RNA complement (per RNA transcription) .

;; Both DNA and RNA strands are a sequence of nucleotides.

;; The four nucleotides found in DNA are adenine (A), cytosine (C), guanine (G) and thymine (T).
;; The four nucleotides found in RNA are adenine (A), cytosine (C), guanine (G) and uracil (U).
(ns rna-transcription)

(defn to-rna [dna]
  (let [dna-to-rna (fn [n] (condp = n
                             \G \C
                             \C \G
                             \T \A
                             \A \U
                             (assert false (format "%s is not a valid nucleotide" n))))]
    (apply str (map dna-to-rna dna))))
