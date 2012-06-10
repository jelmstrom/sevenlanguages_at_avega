(defn big [value len] (> (count value) len) )

(defn test [value len expected] (if (= (big value len) expected)
                                          (println "Test passed")
                                            (println (str "Test for " value " longer than " len "faled to yield " expected))
                                )
  )

(test "hello" 3 true)
(test "hello" 5 false)
(test "hello" 6 false)

