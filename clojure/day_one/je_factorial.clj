
(defn fact [n] (if (= n 1) n (* n (fact (- n 1))))) 
(def facts '(1 2 3 4 5))

(def res (map (fn [x] (fact x)) facts))

(defn testfact [n expected] (if (= expected (fact n))
                                 (println "test passed")
                                 (println "test for " n "failed to yield " expected " Was " (fact n))
                             )
  )

(testfact 1 1)
(testfact 2 2)
(testfact 3 6)
(testfact 4 24)
(testfact 5 120)

