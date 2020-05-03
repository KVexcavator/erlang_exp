-module(useless).
-export([add/2, hello/0, greet_and_add_two/1]).

add(A,B) ->
  A+B.
% Печатает приветствие
% io:format/1 - стандартная функция для печати текста
hello() ->
  io:format("Привет, мир!\n").
greet_and_add_two(X) ->
  hello(),
  add(X,2).
