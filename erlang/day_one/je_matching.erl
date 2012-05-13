-module(je_matching).
-export([match/1]).
-export([match2/1]).

match({error,Message}) -> erlang:display("error:" ++Message);
match(success) -> erlang:display("success").

match2(Input) -> 
	case Input of
		success -> erlang:display("success");
		{error,Message} -> erlang:display("error ::" ++Message);
		_ -> false
	end
	. 
