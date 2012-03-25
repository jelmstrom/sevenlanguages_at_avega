Builder := Object clone
indent := ""
Builder forward := method(ind := ind .. " "
	writeln (ind, "<", call message name, ">")
	call message arguments foreach(arg,
		content := self doMessage( arg);
		if(content type == "Sequence", writeln(content)))
		ind := ind 
	writeln(ind , "</", call message name, ">")
	indent := " "
)
	

Builder ul(
	li("IO"),
	li("Lua"),
	li("JS")
	)
