
list_chunk(_ ,0, _,[]).
list_chunk([Head|Tail],Size,Temp,[Head|Acc]):-
	Y is Size-1, 
	list_chunk(Tail,Y,Temp,Acc).


list_chunks([Head|Tail],Size,Pos,All) :-
		Md is Pos mod Size,
		Next is Pos+1,
		Md =< 0-> list_chunk([Head|Tail],Size,Total);
		      list_chunks(Tail,Size,Next,All),	 
		write(All).
		
	
	
rows(0,[]).
rows(Size,Rows):- Sz is Size-1,rows(Sz,[[]|Rows]).
	 
		
		

 
rows(Puzzle, Rows, X, Size). 


inf_sdk(Puzzle, Solution):- 
	Solution =  Puzzle,
	length(Puzzle,Ln),
	Size is  floor(sqrt(Ln)),
	write(Size),
	rows(Puzzle,Rows,0,Size),
	pretty_print(Rows).

pretty_print([Head|Tail]) :- write(Head), write('\n'), pretty_print(Tail).
