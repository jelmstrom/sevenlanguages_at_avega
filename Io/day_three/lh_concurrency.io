
Numbers := Object clone
Numbers shouldPrint := nil;

# ugly!
Number waitForMeToBeDone := method();

OddNumbers := Numbers clone
OddNumbers shouldPrint = method(nr, nr % 2 != 0);

EvenNumbers := Numbers clone
EvenNumbers shouldPrint = method(nr, nr % 2 == 0);

Numbers count := method(
	sum := 0;
	100 repeat (i,
		if(shouldPrint(i), writeln(self type, "\t", i); sum = sum + i);
#		wait(0.1);
		yield;
	)
	return sum;
)	

writeln("Starting…");
evens := EvenNumbers @count;
odds := OddNumbers @count;

# ugly, wait for the future to be done so that the writeln will print everything on one row
evens 	waitForMeToBeDone;
odds 	waitForMeToBeDone;

writeln("Even done: ", evens);
writeln("Odd done: ", odds);

#Coroutine currentCoroutine pause
