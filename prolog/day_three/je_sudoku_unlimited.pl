
list_chunk(_ ,0, _,[]).
list_chunk([Head|Tail],Size,Temp,[Head|Acc]):-
	Y is Size-1, 
	list_chunk(Tail,Y,Temp,Acc).
	 
		
		

 
rows(Puzzle, Rows, X, Size). 


inf_sdk(Puzzle, Solution):- 
	Solution =  Puzzle,
	length(Puzzle,Ln),
	Size is  floor(sqrt(Ln)),
	write(Size),
	rows(Puzzle,Rows,0,Size),
	pretty_print(Rows).

pretty_print([Head|Tail]) :- write(Head), write('\n'), pretty_print(Tail).
