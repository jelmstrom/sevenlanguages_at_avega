
TwoDim := Object clone

TwoDim dim := method(x,y,
	writeln(x, " ", y);
 	l := list();
	x repeat(
		l2 := list();
		l2 setSize(y);
		l append(l2);
	)
	return l;
)

TwoDim dim(2,2) println

"------" println

TwoDim dim(5,6) println
