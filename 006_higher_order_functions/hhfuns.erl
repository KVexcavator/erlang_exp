-module(hhfuns).
-compile(export_all).

one() -> 1.
two() -> 2.
% hhfuns:add(fun hhfuns:one/0, fun hhfuns:two/0).
add(X,Y) -> X() + Y().

% L=[1,2,3,4,5].
% hhfuns:increment(L).
increment([]) -> [];
increment([H|T]) -> [H+1|increment(T)].
% hhfuns:decrement(L).
decrement([]) -> [];
decrement([H|T]) -> [H-1|decrement(T)].
% to mapping
map(_,[]) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].
% hhfuns:map(fun hhfuns:incr/1, L).
incr(X) -> X+1.
% hhfuns:map(fun hhfuns:decr/1, L).
decr(X) -> X-1.

% замыкания
% hhfuns:b(hhfuns:a()).
a() ->
  Secter = "pony",
  fun() -> Secter end.
b(F) ->
  "a/0's passcord is "++F().

% Фильтр
% hhfuns:filter(fun(X) -> X rem == 2 end, [1,2,3])
filter(Pred, L) -> lists:reverse(filter(Pred, L, [])).
filter(_, [], Acc) -> Acc;
filter(Pred, [H|T], Acc) ->
  case Pred(H) of
    true -> filter(Pred, T, [H|Acc]);
    false -> filter(Pred, T, Acc)
  end.

% Свёртки (fold)
% [H|T] = [1,2,3]
% hhfuns:fold(fun(A,B) when A > B -> A; (_,B) -> B end, H, T).
fold(_, Start, []) -> Start;
fold(F, Start, [H|T]) -> fold(F, F(H,Start), T).
