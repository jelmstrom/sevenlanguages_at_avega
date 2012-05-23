-module(tictactoe).
-export([squaresWith/2]).
%-export([hasWinningCombination/1]).
%-export([equals/2].
-export([contains/2]).
-export([isAWinner/2]).
%-export(determineWinner/1).

%Square = {mark, x, y}

%determineWinner(Board) -> 

squaresWith(CompareMark,Board) -> [{Xcoor, Ycoor} || {Mark, Xcoor, Ycoor} <- Board, Mark == CompareMark ].

%hasWinningCombination(MarkedCoordinates) -> 
%	Winner1 = [{1,1}, {1,2}, {1,3}].
%	Winner2 = [{2,1}, {2,2}, {2,3}].
%	Winner3 = [{3,1}, {3,2}, {3,3}].
%	Winner4 = [{1,1}, {2,1}, {3,1}].
%	Winner5 = [{1,2}, {2,2}, {3,2}].
%	Winner6 = [{1,3}, {2,3}, {3,3}].
%	Winner7 = [{1,1}, {2,2}, {3,3}].
%	Winner8 = [{1,3}, {2,2}, {3,1}].
%	WinningCombinations = [Winner1, Winner2, Winner3, Winner4, Winner5, Winner6, Winner7, Winner8].
%	false.

isAWinner(Coordinates, WinningCombination) ->
	if 
		lists:member(lists:nth(1, WinningCombination), Coordinates) andalso
		lists:member(lists:nth(2, WinningCombination), Coordinates) andalso
		lists:member(lists:nth(3, WinningCombination), Coordinates) -> true
	end.




contains(Coordinate, ListOfCoordinates) -> lists:any(fun(FromList) -> Coordinate == FromList end, ListOfCoordinates).
