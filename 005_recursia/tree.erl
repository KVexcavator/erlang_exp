-module(tree).
-export([empty/0, insert/3, lookup/2]).

% построение дерева 
% базовый случай
empty() -> {node, 'nil'}. 
% построение
% T1 = tree:insert("Name","Value", tree:empty()).
% T2 = tree:insert("Name1","Value1", T1)
% Values = tree:insert("Name2","Value2", tree:insert("Name3","Value3", tree:insert("Name4", "Value4", T2))).
insert(Key, Val, {node,'nil'}) ->
  {node, {Key,Val,{node,'nil'}, {node,'nil'}}};
insert(NewKey, NewVal, {node, {Key,Val, Smaller,Larger}})
  when NewKey < Key ->
    {node,{Key,Val, insert(NewKey,NewVal,Smaller), Larger}};
insert(NewKey, NewVal, {node, {Key,Val, Smaller,Larger}})
  when NewKey > Key ->
    {node, {Key,Val,Smaller, insert(NewKey,NewVal,Larger)}};
insert(Key,Val, {node, {Key, _, Smaller, Larger}}) ->
  {node, {Key,Val, Smaller, Larger}}.
% поиск в Values
% tree:lookup("Name3", Values).
lookup( _, {node, 'nil'}) ->
  undefined;
lookup(Key, {node, {Key, Val, _, _}}) ->
  {ok, Val};
lookup(Key, {node, {NodeKey, _, Smaller, _}}) when Key < NodeKey ->
  lookup(Key,Smaller);
lookup(Key, {node, {_, _, _, Larger}}) ->
  lookup(Key, Larger).

