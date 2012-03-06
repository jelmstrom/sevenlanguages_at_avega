a := list(1,2,3)

f := File with("foo.txt")
f openForAppending
f write(a serialized())
f close

f2 := doFile("foo.txt");

writeln("f2 = ", f2);
f2 at(2) println