valid_position((Row,Column)):-  member(Row,[1,2,3,4,5,6,7,8]), member(Column,[1,2,3,4,5,6,7,8]).
valid_positions([]).
valid_positions([Queen|Tail]) :- valid_position(Queen),valid_positions(Tail).


collect_rows([],[]).
collect_rows([(Row,_)|Tail],[Row|RTail]) :- collect_rows(Tail, RTail). %-- recurse and stuff values in row
unique_rows(Board) :- collect_rows(Board,Rows), fd_all_different(Rows). %-- collect and check rows


collect_columns([],[]).
collect_columns([(_,Col)|Tail],[Col|CTail]) :- collect_columns(Tail, CTail). %-- recurse and stuff values in row
unique_columns(Board) :- collect_columns(Board,Cols), fd_all_different(Cols). %-- collect and check rows

diagonal_one([],[]).
diagonal_one([(Row,Col)|Tail], [Y|DTail]) :- Y is (Row-Col), diagonal_one(Tail,DTail). %-- subtracting row & Col is inspired (1,1 & 2,2 is on same diagonal (0))

diagonal_two([],[]).
diagonal_two([(Row,Col)|Tail], [Y|DTail]) :- Y is (Row+Col), diagonal_two(Tail,DTail). %-- adding row & Col is inspired (1,2) and (2,1) is on same diagonal(3)

unique_diagonals(Board) :- 	diagonal_one(Board, DiagonalOne),
			 	fd_all_different(DiagonalOne), 
			 	diagonal_two(Board, DiagonalTwo), fd_all_different(DiagonalTwo).



queens(Board) :- 
	valid_positions(Board),
	unique_rows(Board),
	unique_columns(Board), 
	unique_diagonals(Board).


