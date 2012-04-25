listsort(Org,Sorted) :- msort(Org,Sorted). %-- cheating


insert_sort(List,Sorted):-insert_sort(List,[],Sorted). %-- Accumulator
insert_sort([],Acc,Acc).  %-- Fact! at end
insert_sort([Head|Tail],Acc,Sorted):-insert(Head,Tail,NxT,Max), insert_sort(NxT,[Max|Acc],Sorted). %-- move Head to correct position, rinse repeat..
   
insert(Head,[],[],Head). %-- fact! no more items in tail. Max is Head.
insert(Head,[Next|Tail],[Next|NxT],Max):-Head>Next,  insert(Head,Tail,NxT,Max). %-- Head greater than next - move it further back
insert(Head,[Next|Tail],[Head|NxT],Max):-Head=<Next, insert(Next,Tail,NxT,Max). %-- Head smaller than next - move on..


