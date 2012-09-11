-module(je_shopping).
-export([withTotal/1]).

withTotal(TheList) -> [{Item, Price*Quantity} || {Item, Price, Quantity} <-TheList].
