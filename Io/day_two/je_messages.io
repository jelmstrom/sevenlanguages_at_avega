caller := Object clone
caller yes := method("yes" println)
caller no := method("no" println)
caller valid := true 


callee := Object clone
callee is := method (if(call sender doMessage(call message argAt(0))) then (call sender doMessage(call message argAt(1))) else (call sender doMessage(call message argAt(2)))
 )

caller delegate := method(callee is(valid, yes, no))
callee is(1==2,writeln("yes"),writeln("no"))
caller delegate
caller valid = false
caller delegate

