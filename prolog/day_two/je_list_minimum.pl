listmin([Head|Tail], Min) :- listmin(Tail,Head, Min). %-- init
listmin([], Min, Min) :- write(Min). %-- last Item.
listmin([Head|Tail], LastMin, Min ) :-
                 	(Head<LastMin->CurrentMin is Head;CurrentMin is LastMin),
                 	listmin(Tail,CurrentMin,Min).

