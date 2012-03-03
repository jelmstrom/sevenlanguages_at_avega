myAvg := method(aList, 
                idx := 0;
                result := 0;
                if(aList type =="List"
                , while(idx < aList size
                        , checkNumber(aList at(idx)); result = (result + aList at(idx)); idx = (idx +1) 
                        );
                  result / (aList size)
                , result = -1)
             )
checkNumber := method(input, writeln("check number ", input))

writeln(myAvg(list(2,4,6)))



                                  
