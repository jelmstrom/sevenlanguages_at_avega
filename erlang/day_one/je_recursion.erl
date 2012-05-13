-module(je_recursion).
-export([count_to/2]).
count_to(0,_) -> erlang:display(0);
count_to(N, descending) -> erlang:display(N), count_to(N-1,descending);
count_to(N, ascending) -> count_to(N-1,ascending), erlang:display(N).
