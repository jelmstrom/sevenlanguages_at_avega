-module(je_recursion).
-export([count_to/2]).
-export([count_to_ten/1]).
-export([count_to_ten/0]).
-export([wordcount/1]).
-export([find_next/1]).


%Strings are arrays of ints - useful!!!
wordcount([]) ->0; % spaces after the last word ends up here - dont count
wordcount([32|Tail]) -> wordcount(Tail); % keep recursing until the first character isnt space
wordcount(Rest) -> find_next(Rest). % Doesnt start with 32 - its a word.


find_next([]) ->1; % No space after last word - count it.
find_next([32|Tail]) -> 1+wordcount(Tail); % Leading space - count as a word and continue
find_next([_|Tail]) ->find_next(Tail). %recurse until next space found 

%Prolog style matching any..
count_to_ten() -> count_to_ten(ascending).
count_to_ten(Direction) -> count_to(10,Direction).
count_to(1,_) -> erlang:display(1);
count_to(N, descending) -> erlang:display(N), count_to(N-1,descending);
count_to(N, ascending) -> count_to(N-1,ascending), erlang:display(N).

