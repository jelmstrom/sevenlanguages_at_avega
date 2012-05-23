-module(counter).
-export([count/1]).

count(Number) -> count(Number-1, 1).
count(0, Count) -> Count;
count(Number, Count) -> count(Number-1, Count+1).
