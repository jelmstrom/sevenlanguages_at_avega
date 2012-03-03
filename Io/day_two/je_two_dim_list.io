twoDimList := List clone
twoDimList dim := method(x,y, 
                 self setSize(x);
                 for(index,1,x-1, ls := list(); ls setSize(y); self atPut(index,ls ))
                  )

instance := twoDimList clone dim(3,3)
writeln(instance size)
writeln(instance at(2) size)
