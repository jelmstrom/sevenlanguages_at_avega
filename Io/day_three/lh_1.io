Builder := Object clone

Builder depth := 0;
Builder lastWasStartTag := false;

Builder forward := method(
	writeStartTag(call message name);
	call message arguments foreach(arg,
		content := self doMessage(arg);
		if(content type == "Sequence", write(content))
	)
	writeEndTag(call message name);
)

Builder writeStartTag := method(tag, 
	writeln(""); 
	depth repeat(write("  ")); 
	write("<", tag, ">")
	lastWasStartTag = true;
	depth = depth + 1;
)

Builder writeEndTag := method(tag, 
	depth = depth - 1;
	if(lastWasStartTag, nil, writeln(""); depth repeat(write("  ")); );
	write("</", tag, ">")
	self lastWasStartTag = false;	
)



Builder forward2 := method(
	writeHtmlTag(call message, " x ");
)

Builder writeHtmlTag := method(tag, spaces,
	writeln(spaces, "<", tag name, ">")
	tag arguments foreach(
		arg,
		content := self doMessage(arg, " y ");
		if(content type == "Sequence", writeln(content)))
	writeln("</", tag name, ">")
	
)

builder := Builder clone

builder ul(
	li("Io"),
	li("Lua"),
	li("JavaScript")
)

writeln("");

builder2 := Builder clone
builder2 html(head(style("color=red;")), 
	body(div("hey"),  
		ul(
		li("Io"),
		li("Lua"),
		li("JavaScript")
		)
	)
)

writeln("");