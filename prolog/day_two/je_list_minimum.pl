minval([Head|Tail], Min) :- minval(Tail,Head, Min). %-- init
minval([], Min, Min) :- write(Min). %-- last Item.
minval([Head|Tail], PrevMin, Min ) :-
                ( 
			Head < PrevMin->CurrentMin is Head;CurrentMin is PrevMin
                ), 
                minval(Tail,CurrentMin,Min).

