minimum(Old, New, Min) :- Old < New, Min is Old.
minimum(Old, New, Min) :- New < Old, Min is New. 

list_min([], 1000000).
list_min([Head|Tail], Min) :- list_min(Tail, OldMin), minimum(OldMin, Head, Min).
