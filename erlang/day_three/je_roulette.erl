-module(je_roulette).
-export([roulette/0]).

roulette() ->
    receive

        3 -> io:format("bang!~n") , exit({erlang:time()});
        _ ->  io:format("click.~n"), roulette()
end.

