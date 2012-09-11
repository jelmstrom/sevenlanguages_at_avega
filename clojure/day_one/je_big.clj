(defn big [value len] (> (count value) len) )

(defn testbig [value len expected] (if (= (big value len) expected)
                                        (println "Test passed")
                                        (println (str "Test for " value " longer than " len "faled to yield " expected))
                                )
  )

(testbig "hello" 3 true)
(testbig "hello" 5 false)
(testbig "hello" 6 false)

