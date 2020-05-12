-module(tail_recursion).
-export([fac/1,loop/1,fib/1,perfect/1]).

fac(N) ->
    fac(N,1).

fac(0,P) ->
    P;
fac(N,P) when N>0 ->
    fac(N-1, P*N).

loop(N) when N>0 ->
    io:format("~p~n",[N]),
    loop(N-1);
loop(_N) ->
    io:format("bye ~n").

fib(0,R,_) ->
    R;
fib(N,R,A) when N>0 ->
    fib(N-1, A, R+A).

fib(N) ->
    fib(N,0,1).

perfect(N,0,A) ->
    N==A;
perfect(N,D,A) when D>0 ->
    S = case N rem D of
            0 -> A + D;
            _ -> A
        end,
    perfect(N,D-1,S).

perfect(N) ->
    perfect(N,N-1,0).
