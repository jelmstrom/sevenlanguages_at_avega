-module(je_matching).
-export([match/1]).
-export([match2/1]).

% By signature
match({error,Message}) -> erlang:display("error:" ++Message);
match(success) -> erlang:display("success").

% By cases (why wourd I want to to this?)
match2(Input) -> 
	case Input of
		success -> erlang:display("success");
		{error,Message} -> erlang:display("error ::" ++Message);
		_ -> false
	end
	. 
