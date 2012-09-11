-module(je_doctor).
-export([doctor/0]).


doctor() ->
 process_flag(trap_exit, true),
 
 receive 
	new -> io:format("New pistol registered. ~n"),
		register(pistol, spawn_link(fun je_roulette:roulette/0)),
		doctor();
 	 {'EXIT', From, Process} ->
		io:format("Dead!~n"),
		self() ! new,  
		doctor()
	end.

