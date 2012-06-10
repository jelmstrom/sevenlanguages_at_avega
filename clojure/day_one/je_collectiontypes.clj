(defn colltype [colln] (if (= (type {}) (type colln))
                        :map
                        (if (= (type #{}) (type colln))
                            :set
                          (if (= (type '[]) (type colln))
                            :list
                            :nollcoll
                          )
                        )
                      )

 )


(defn testcolltype [coll expected] (if (= (colltype coll) expected)
                              (println "test passed")
                              (println (str "Test for" (type coll) " failed. Expected " expected " got " (colltype coll))
                              )
                            )
)

(testcolltype {:one :two} :map)
(testcolltype #{:one :two} :set)
(testcolltype [:one :two] :list)
(testcolltype "String" :nollcoll)



