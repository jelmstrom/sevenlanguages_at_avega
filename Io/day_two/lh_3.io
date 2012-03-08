
listSum := method(l, 
	sum :=0; 
	l foreach(v, 
		if(v type == "List", 
			sum = sum + listSum(v), 
			sum = sum + v
		)
	)
)


a := list(list(1,2,3), list(4,5,6), list(7,8,9))
b := list(1,2,3)

writeln("sum of ", b, " is ", listSum(b))
writeln("sum of ", a, " is ", listSum(a))