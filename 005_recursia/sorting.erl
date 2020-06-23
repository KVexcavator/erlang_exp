-module(sorting).
-export([quicksort/1, lc_quicksort/1]).

% примитивная сортировка

quicksort([]) -> [];
quicksort([Pivot | Rest]) ->
  {Smaller, Larger} = partition(Pivot,Rest,[],[]),
  quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).
partition(_,[],Smaller,Larger) -> {Smaller, Larger};
partition(Pivot, [H | T], Smaller, Larger) ->
  if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
     H > Pivot -> partition(Pivot, T, Smaller, [H|Larger])
  end.

% сщртировка с помощью генераторов списков
lc_quicksort([]) -> [];
lc_quicksort([Pivot|Rest]) ->
  lc_quicksort([Smaller || Smaller <- Rest, Smaller =< Pivot])
  ++ [Pivot] ++
  lc_quicksort([Larger||Larger <- Rest, Larger > Pivot]).
