(defn large? [x limit] (> x limit) )
(defn filterlargerthan [seq limit] (for [x seq, :when (large? x limit)] x))

(defn testseq [seq limit expected] (if (= (filterlargerthan seq limit) expected)
                                    (println "Test passed")
                                    (println (str "Test for " seq " did not yield " expected " but " (into '[] (filterlargerthan seq limit))))
                                   )
)

(testseq [1 2 3] 1 [2 3])
(testseq [1 2 3] 2 [3])
(testseq [1 7 2 6 3 5] 3 [7 6 5])


