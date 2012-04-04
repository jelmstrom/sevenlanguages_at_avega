sortera([],[]).
sortera([A],[A]).
sortera([A,B|TAIL],AB):-
(  A =< B
    -> sortera([B|TAIL],C), AB = [A,C]
    ;  sortera([A|TAIL],C), AB = [B,C] 
     ).
