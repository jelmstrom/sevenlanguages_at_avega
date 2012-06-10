
(defn fact [n] (if (= n 1) n (* n (fact (- n 1))))) 

(map (fn [x] (fact x)) facts) 

