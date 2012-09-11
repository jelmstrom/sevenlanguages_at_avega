-module(je_monitor).
-behaviour(supervisor).
-export([start/0]).
-export([init/1]).

start() ->
	io:format("Starting monitor...~n"),
 	Pid=spawn_link(fun je_doctor:doctor/0),
	register(doc,Pid),
	{ok, Pid}.
 
init([Id]) ->
	{ok, {{one_for_one, 10,60},
		[{?MODULE, {?MODULE, start,[]},
			permanent, brutal_kill, worker, [?MODULE]}]}}.	
