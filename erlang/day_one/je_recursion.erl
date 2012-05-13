-module(je_recursion).
-export([count_to/2]).
-export([count_to_ten/1]).
-export([count_to_ten/0]).
-export([wordcount/1]).


%Strings are arrays of ints - useful!!!
wordcount([]) ->0;  %empty string to start with
wordcount([32|[]]) -> 0; % trailing spaces are not a word
wordcount([_|[]]) ->  1; % ends without trailing spaces 
wordcount([32|Tail]) -> wordcount(Tail); % keep recursing until the first character isnt space
wordcount([_|[32|Tail]]) -> 1+wordcount(Tail); % The tail is teh beginning of a word
wordcount([_|Tail]) -> wordcount(Tail). % not empty,end or starts with space - keep recursing


%Prolog style matching any..
count_to_ten() -> count_to_ten(ascending).
count_to_ten(Direction) -> count_to(10,Direction).
count_to(1,_) -> erlang:display(1);
count_to(N, descending) -> erlang:display(N), count_to(N-1,descending);
count_to(N, ascending) -> count_to(N-1,ascending), erlang:display(N).

