-module(je_tuples).
-export([values/2]).
-export([tupleValues/2]).



values(Tuples, Keyword) ->lists:map(fun(Item) -> element(2,Item) end,lists:filter(fun(Tuple) -> element(1,Tuple) == Keyword  end, Tuples)).
filteredTuples(Tuples, Keyword) -> lists:filter(fun(Tuple) -> element(1,Tuple) == Keyword end, Tuples).
tupleValues(Tuples, Keyword) -> [element(2,Item) || Item <- filteredTuples(Tuples,Keyword)].


