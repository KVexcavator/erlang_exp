-module(exeptions).
-compile(export_all).

% exeptions:throws(fun() -> throw(thrown) end).
% exeptions:throws(fun() -> erlang:error(my_error) end).
throws(F)->
  try F() of
    _-> ok
  catch
    Throw -> {throw, caught, Throw}
  end.

% exeptions:errors(fun() -> erlang:error("Deed!" end)).
errors(F) ->
  try F() of
    _ -> ok
  catch
    error:Error -> {error, caught, Error}
  end.

% exeptions:exits(fun() -> exit(goodbye) end).
exits(F) ->
  try F() of
    _ -> ok
  catch
    exit:Exit -> {exit, caught, Exit}
  end.

% комбинирование всех типов исключений
% exeptions:black_knight(fun() -> exeptions:sword(1) end).
sword(1) -> throw(slice);
sword(2) -> erlang:error(cut_arm);
sword(3) -> exit(cut_leg);
sword(4) -> throw(punch);
sword(5) -> exit(cross_bridge).

black_knight(Attack) when is_function(Attack, 0) ->
  try Attack() of
    _ -> "Nome shall pass."
  catch
    throw:slice -> "It is but a scratch.";
    error:cut_arm -> "I've had worse.";
    exit:cut_leg -> "Come on you pansy!";
    _:_ -> "Just a flesh wound."
  end.
% exeptions:talk().
% exeptions:black_knight(fun exeptions:talk/0).
talk() -> "blah blah".

% конструкция catch
% exeptions:catcher(6,0)
catcher(X,Y) ->
  case catch X/Y of
    {'EXIT', {badarith,_}} -> "uh uh";
    N -> N
  end.
