(defmacro unless [test body]
  (list 'if (list 'not test) body :failed)
  )



(defn testunless [condition expression expected] (if (=(unless condition expression) expected)
                                                 (println "Test passed")
                                                 (println (str "Test failed got " (unless condition expression) " not " expected))

                                            )
 )

(testunless false "Yes" "Yes")
(testunless true "Yes" :failed)
(testunless (= 1 1)  (apply * (take 5 (iterate inc 1))) :failed)
(testunless (= 1 2)  (apply * (take 5 (iterate inc 1))) 120)
