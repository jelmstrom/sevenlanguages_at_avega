-module(value_finder).
-export([valueFor/2]).
-export([hasKeyword/2]).

hasKeyword(Tuple, Keyword) -> 
	case Tuple of
		{Keyword, _} -> true;
		{_,_} -> false
	end.

valueFor(Tuplelist, Keyword) -> [Tuple || Tuple <- Tuplelist, hasKeyword(Tuple,Keyword)].
