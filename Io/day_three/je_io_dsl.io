OperatorTable addAssignOperator(":", "add")
curlyBrackets := method(
        values := Map clone;
        call message arguments  foreach(arg, values doMessage(arg));
	values
	)

Map add := method(
	self atPut(call evalArgAt(0), call evalArgAt(1))
)

s := File with("expenses.txt") openForReading contents
expenses := doString(s)
expenses keys println
expenses values println 

