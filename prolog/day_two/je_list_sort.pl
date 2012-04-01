listsort(Org,Sorted) :- msort(Org,Sorted). %-- cheating


insert_sort(List,Sorted):-sort(List,[],Sorted). %-- Accumulator
insert_sort([],Acc,Acc).  %-- end of list, should be sorted
insert_sort([Head|Tail],Acc,Sorted):-insert(Head,Tail,NxT,Max),write('insert ...'), insert_sort(NxT,[Max|Acc],Sorted). %-- move Head to correct position, rinse repeat..
   
insert(Head,[],[],Head). %-- single value - sorted...
insert(Head,[Next|Tail],[Next|NxT],Max):-Head>Next,  insert(Head,Tail,NxT,Max). %-- Head greater than next - move it further back
insert(Head,[Next|Tail],[Head|NxT],Max):-Head=<Next, insert(Next,Tail,NxT,Max). %-- Head smaller than next - move on..


