-module(je_numbers).
-export([fib/1]).
-export([fact/1]).

fact(0) -> 1;
fact(Fact) -> Fact*fact(Fact-1) .

fib(0) ->1;
fib(1) ->1;
fib(Fib) -> fib(Fib-1)+(Fib-2) .
