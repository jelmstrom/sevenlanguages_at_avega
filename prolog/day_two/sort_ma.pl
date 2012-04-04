sortera([],[]).
sortera([A],[A]).
sortera([A,B|TAIL],AB):-
newList(A,B,C),sortera(TAIL,C)

newList(A,B,C):-
(  A =< B
    -> C = [C, A,B]
    ; C = [C, B,A] 
     ).
newList(A,B,[]):-
(  A =< B
    -> C = [A,B]
    ;  C = [B,A] 
     ).
