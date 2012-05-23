-module(matcher).
-export([printRes/1]).

printRes("success") -> "Success";
printRes({error, Message}) -> "error:"++ Message.
