rev([], Rev, Rev).
rev([Head|Tail],Temp,Rev) :- rev(Tail,[Head|Temp], Rev).

%-- vill göra såhär...
rev2([],[]).
rev2([Head|XTail],[RevTail|Head]) :- rev2(XTail, RevTail).
%--  => [[[[]|3]|2]|1]

