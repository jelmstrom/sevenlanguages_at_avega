four_sudoku(Puzzle, Solution) :-
	Solution = Puzzle,
	Puzzle = 
		[S11,S12,S13,S14,
		 S21,S22,S23,S24,
		 S31,S32,S33,S34,
		 S41,S42,S43,S44],
	fd_domain(Solution,1,4),

	Row1=[S11,S12,S13,S14],
	Row2=[S21,S22,S23,S24],
	Row3=[S31,S32,S33,S34],
	Row4=[S41,S42,S43,S44],

	Col1=[S11,S21,S31,S41],
	Col2=[S12,S22,S32,S42],
	Col3=[S13,S23,S33,S43],
	Col4=[S14,S24,S34,S44],

	Sq1=[S11,S12,S21,S22],
	Sq2=[S31,S32,S41,S42],
	Sq3=[S13,S14,S23,S24],
	Sq4=[S33,S34,S43,S44],

	fd_all_different(Row1),
	fd_all_different(Row2),
	fd_all_different(Row3),
	fd_all_different(Row4),
	fd_all_different(Col1),
	fd_all_different(Col2),
	fd_all_different(Col3),
	fd_all_different(Col4),
	fd_all_different(Sq1),
	fd_all_different(Sq2),
	fd_all_different(Sq3),
	fd_all_different(Sq4).
	
