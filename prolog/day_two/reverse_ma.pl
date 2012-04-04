
reverseA([],List, List).
reverseA([Head|Tail],Temp,Ny):-
	reverseA(Tail,[Head, Temp],Ny).
 
		rev([], Rev, Rev).
rev([Head|Tail],Temp,Rev) :- rev(Tail,[Head|Temp], Rev).


reverseB([],[]).
reverseB([Head|Tail],[List,Head]) :-
reverseB(Tail,List).
