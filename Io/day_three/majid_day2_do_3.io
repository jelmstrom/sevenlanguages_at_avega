l1 := list(1,2,3,4)
l2 := list(l1,l1,l1,l1)
l2 println
sum := 0

"\n\nMethod 1, old fashin" println
for(i, 0, l2 size-1, sum := sum + l2 at(i) sum)
sum println
 


"\n\nMethod 2, Io way" println
sum := 0
l2 foreach(v, sum = sum + v sum)
sum println

