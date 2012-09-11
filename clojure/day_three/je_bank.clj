(defprotocol Bank
  ;basic features
  (openAccount [this account])
  (deposit [this account amount])
  (withdraw [this account amount])
  (balance [this account])
)

(defrecord BankOfAvega [accounts]
  Bank
  ;contract

  (openAccount [this account] (dosync
                                  (alter (:accounts this) assoc account 0 )
                              )
  )
  (deposit [this account amount] (dosync
                                    (alter (:accounts this) assoc account (+ amount (balance this account))
                                    )
                                 )
  )
  (withdraw [this account amount] (dosync
                                    (alter (:accounts this) assoc account (- (balance this account) amount)
                                      )
                                    )
    )
  (balance [this account] ((deref (:accounts this)) account ))
)

(defmacro testBank [action expected]
  (list 'if (list '= action expected) (list 'println "Test passed") (list 'println "test failed")
  )
)

(def bank (BankOfAvega. (ref {})) )
(testBank (deref (:accounts bank)) {} )
(openAccount bank "12345")
(testBank (balance bank "12345") 0)
(deposit bank "12345" 10)
(testBank (balance bank "12345") 10)
(deposit bank "12345" 10)
(testBank (balance bank "12345") 20)
(withdraw bank "12345" 5)
(testBank (balance bank "12345") 15)
