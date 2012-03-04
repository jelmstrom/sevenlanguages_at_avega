TwoDimList := List clone
TwoDimList dim := method(x,y, 
                 self setSize(x);
                 for(index,0,x-1, ls := list(); ls setSize(y); self atPut(index,ls ))
                  )

TwoDimList set := method(x,y,value, self at(x) atPut(y,value))
TwoDimList get := method(x,y, self at(x) at(y))

TwoDimList transpose := method(
			x := self size 
			y := self first size
			target := self proto clone dim(y,x)
			for(i,0,x-1,
				for(ii, 0, y-1, target set(ii,i, self get(i, ii))
      				)
			)
			target  
                               
   		)


TwoDimList toFile := method(
		f := File clone open("the_matrix.txt") write(self serialized) flush;
		)	


TwoDimList fromFile := method(fileName,
				lists := doFile(fileName);
				instance := TwoDimList clone dim(lists size, 0); # 2nd is arbitrary, copying lists
				for(i, 0, ((lists size) -1),
					instance atPut(i, lists at(i))
				)
			instance				
			)

instance := TwoDimList clone dim(3,3)
writeln("Instance created to x dimension size: ", instance size)
writeln("y dimensio has type : ", instance at(2) type)
writeln("default value:  ",  instance get(0,0))
instance set(0,1,10)
writeln("Value of 0,1 after set : ", instance get(0,1))
transposed := instance transpose
writeln("Transposed 1,0 matches original 0,1? : ", instance get(0,1) == transposed get(1,0))
instance toFile()
instanceRead := doFile("the_matrix.txt")
writeln("read from disk using doFile: ", instanceRead)
typed := TwoDimList fromFile("the_matrix.txt")
writeln("With typing to matrix, value from get 0,1  : ", typed get(0,1))
