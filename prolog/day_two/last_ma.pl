last([],[]).
last([Head|[TailHead|TailTail]],Last):-
last(TailTail,Last),TailHead.

