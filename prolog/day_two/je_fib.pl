fib(0,0).
fib(1,1).
fib(N, Result):- First is Nth -1, Second is Nth-2, fib(First,FirstResult), fib(Second, SecondResult), Result is (FirstResult + SecondResult).
