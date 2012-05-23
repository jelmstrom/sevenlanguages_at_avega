-module(word_count).
-export([number/1]).

number(String) -> number(String, 0).
number([32 | Rest], Word_count) -> number(Rest, Word_count+1);
number([], Word_count) -> Word_count+1;
number([Head | Rest], Word_count) -> number(Rest, Word_count).
