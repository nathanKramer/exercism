(ns beer-song
  (:require [clojure.string :as str]))

(defn- generalised-verse [num]
  (format
   "%s bottles of beer on the wall, %s bottles of beer.\nTake one down and pass it around, %s bottles of beer on the wall.\n"
   num
   num
   (dec num)))

(defn verse
  "Returns the nth verse of the song."
  ([num]
   (case num
     0 "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
     1 "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
     2 "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
     (generalised-verse num))))

(defn sing
  "Given a start and an optional end, returns all verses in this interval. If
  end is not given, the whole song from start is sung."
  ([start] (sing start 0))
  ([start end] (str/join "\n"
                         (->>
                          (range start (dec end) -1)
                          (map verse)))))
