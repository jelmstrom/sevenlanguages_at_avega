
listSum := method(l, 
	sum :=0; 
	l foreach(v, 
		if(v type == "List", 
			sum = sum + listSum(v), 
			sum = sum + v
		)
	)
)

b := list(1,2,3)

listAverage := method(l, if(l size == 0, 0, listSum(l) / l size))

b := list(1,2,3)
writeln("Average of ", b, " is ", listAverage(b))

b := list()
writeln("Average of ", b, " is ", listAverage(b))