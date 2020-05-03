-module(functions).
-compile(export_all).

% принимает список и возвращает первый аргумент
head([H|_]) -> H.
% принимает список и возвращает второй аргумент 
second([_,X|_]) -> X.
% проверяет равенство двух аргументов
same(X,X) ->
  true;
same(_,_) ->
  false.
% печать даты
valid_time({Date={Y,M,D}, Time={H,Min,S}}) ->
  io:format("Кортеж даты (~p) говорит сегодня: ~p/~p/~p.~n",[Date,Y,M,D]),
  io:format("Кортеж времени (~p) показывает: ~p:~p:~p.~n",[Time,H,Min,S]);
valid_time(_) ->
  io:format("Перестань давать мне незнакомые данные!~n").
