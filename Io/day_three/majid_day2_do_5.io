ML := list clone
ML dim := method(x,y,
	self setSize(x);
	self foreach (k,v, v println; l := list clone;l setSize(y);k println ;self atPut(k, l))
//	self foreach (k,v, v println; l := list clone;l setSize(y);k println ;v := l))
)

ML get := method(x,y,
	l := self at(x-1)
	v := l at(y-1)
)
ML set := method(x,y,value,
	  self at(x-1) atPut(y-1,value)
)



ML dim(2,2)
ML println
ML set(1,2,10)
ML println

ML get (1,11)  println
ML get(1,2) println


