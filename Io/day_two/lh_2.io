(1 / 0) println

oldDivider := Number getSlot("/")

newDiv := method(n, if(n ==0, 0, oldDivider(n)))

Number / = method(n, if(n ==0, 0, oldDivider(n)))

(3 / 4) println

(1 / 0) println


