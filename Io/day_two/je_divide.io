Number divide := Number getSlot("/")
writeln(Number proto slotNames)
writeln("copied / -> divide: ",4 divide(2))
writeln("Original division: ",4 / 2)
Number / = method(denom , if(denom == 0, 0, self divide(denom)))
writeln("New division: ", 4 / 2)
writeln("By zero: ", 4 / 0)
writeln("Original by zero: ", 4 divide(0))

