twoDimList := List clone
twoDimList dim := method(x,y, 
                 self setSize(x);
                 for(index,0,x-1, ls := list(); ls setSize(y); self atPut(index,ls ))
                  )

twoDimList set := method(x,y,value, self at(x) atPut(y,value))
twoDimList get := method(x,y, self at(x) at(y))

twoDimList transpose := method(
			x := self size 
			y := self first size
			target := self proto clone dim(y,x)
			for(i,0,x-1,
				for(ii, 0, y-1, target set(ii,i, self get(i, ii))
      				)
			)
			target  
                               
   		)

instance := twoDimList clone dim(3,3)
writeln(instance size)
writeln(instance at(2) type)
writeln(instance get(0,0))
instance set(0,1,10)
writeln(instance get(0,0))
transposed := instance transpose
writeln(instance get(0,1) == transposed get(1,0))

