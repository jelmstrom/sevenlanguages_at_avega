myAvg := method(aList, 
                idx := 0;
                result := 0;
                if(aList type =="List"
                , while(idx < aList size
                        , checkNumber(aList at(idx)); result = (result + aList at(idx)); idx = (idx +1) 
                        );
                  result / (aList size)
                , Exception raise("Not A List"))
             )

checkNumber := method(input, if(input type != "Number", Exception raise("Not A Number"),input))

writeln(myAvg(list(2,4,6)))
writeln(myAvg(list()))
e := try(
     writeln(myAvg(list(1,2,"3")))
    ) 
e catch( Exception,  writeln("my catch clause" , e)
 writeln(myAvg(1))
)




                                  
