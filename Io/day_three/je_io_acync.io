asyncGet := method(wait(10); File @with("iolang.io"))
inspect := method(f := asyncGet;
			writeln("Current type : ", f type);
			wait(2);
			writeln("Soon opening"); 
			f open;
			f write("writing to file");
			writeln("wrote to file");
			writeln("Type after access : ", f type;)
	)

inspect

# Current type : FutureProxy
# Soon opening
# wrote to file
# Type after access : File
