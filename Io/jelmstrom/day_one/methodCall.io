Vehicle := Object clone
Car := Vehicle clone
Bike := Vehicle clone
Vehicle move := method("move, me?" println)
Car move :=method("Vrooom" println)
Bike move  :=method("whzzzzzzzzzz" println)

volvo := Car clone
crescent :=Bike clone
arbitrary := Vehicle clone

vProto := volvo proto


"#### Volvo moves #####" println
vProto slotNames foreach(slotName, volvo perform(slotName))

"##### Bike moves #####" println
cProto := crescent proto
cProto slotNames foreach(slotName, crescent perform(slotName))

"##### vehicle moves ##" println 
aProto := arbitrary  proto
aProto slotNames println
aProto slotNames foreach(slotNames, writeln(slotName, " -> ", (arbitrary  perform(slotName))))


arbitrary perform("type") 


