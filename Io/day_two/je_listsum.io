the2dArray := list( 
   list(1,3),
   list(2,4),
   list(10,100))
writeln("Sum of all numbers using flaten and reduce : ", the2dArray flatten reduce(+))


sum := method(lst,
           if(lst type == "List",  
              rSum := 0;
              i := 0; 
              while(i < lst size,rSum =(rSum+lst at(i));i=i+1,rSum);  
             rSum
             , 0
            )
)
writeln(sum(list (1,2,3)))
# various := list(list(1,2,3)) 
#  writeln(various sum)
