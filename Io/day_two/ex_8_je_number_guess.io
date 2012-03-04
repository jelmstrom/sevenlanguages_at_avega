reader := File standardInput
target := Random value(1,100) round
diff := 100
idx := 10

while(idx > 0 and diff > 0, idx = (idx-1) ; 
	guess := reader readLine("Have a guess :") asNumber;
	thisDiff := (guess - target) abs;
	if(thisDiff==0, "got it" println, if(thisDiff > diff, "colder" println, "warmer" println));
	diff = thisDiff;
	)
writeln ("Target was : ", target)