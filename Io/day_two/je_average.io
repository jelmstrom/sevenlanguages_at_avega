myAvg := method(aList, 
                idx := 0;
                result := 0;
                if(aList type =="List"
                , result = aList average
                , result = -1)
             )


writeln(myAvg(list(2,4,6)))
                 
                 
