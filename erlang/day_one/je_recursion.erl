-module(je_recursion).
-export([count_to/2]).
-export([count_to_ten/1]).
-export([count_to_ten/0]).




%Prolog style matching any..
count_to_ten() -> count_to_ten(ascending).
count_to_ten(Direction) -> count_to(10,Direction).
count_to(1,_) -> erlang:display(1);
count_to(N, descending) -> erlang:display(N), count_to(N-1,descending);
count_to(N, ascending) -> count_to(N-1,ascending), erlang:display(N).
