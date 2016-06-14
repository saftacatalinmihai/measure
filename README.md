# Memory profiling for erlang

Run a shell with:

```bash
docker run --rm -it -u `id -u` -v "$PWD":/work -w /work erlang rebar3 shell
```

Measure with the following:

```erlang
measure:memory(fun() -> ok end).
measure:memory(fun() -> 1 + 1 end).
measure:memory(fun() -> lists:seq(1, 2) end).
measure:memory(fun() -> lists:seq(1, 20) end).
measure:memory(fun() -> lists:seq(1, 200) end).
measure:memory(fun() -> lists:seq(1, 2000) end).
```

## Refference

http://erlang.org/pipermail/erlang-questions/2009-February/041572.html
