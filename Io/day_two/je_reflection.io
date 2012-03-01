Food := Object clone
Fruit := Food clone
apple := Fruit clone

Object hierarchy := method(
    prototype := self proto
    write(prototype type)
    if(prototype != Object, 
      write( "-->")
      prototype hierarchy
      )
)

apple hierarchy
writeln
