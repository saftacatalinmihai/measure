-module(measure).

%% API exports
-export([memory/1]).

%%====================================================================
%% API functions
%%====================================================================

memory(F) ->
  Parent = self(),

  Pid = spawn(fun() ->
    {memory, M0} = erlang:process_info(self(), memory),
    F(),
    {memory, M1} = erlang:process_info(self(), memory),

    Parent ! {self(), M1 - M0}
  end),

  receive
    {Pid, Bytes} when is_integer(Bytes) -> Bytes
  end.

%%====================================================================
%% Internal functions
%%====================================================================
