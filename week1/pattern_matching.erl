-module(pattern_matching).
-export([
         xor1/2,
         xor2/2,
         xor3/2,
         xor4/2,
         maxThree/3,
         howManyEqual/3,
         test/0
        ]).

xor1(X,Y) ->
    X =/= Y.

xor2(X,Y) ->
    not X == Y.

xor3(X, Y) ->
    X and not Y or Y and not X.

xor4(true,X) ->
    not X;
xor4(false,X) ->
    X.


test_xor() ->
    % test xor1/2
    true = xor1(true,false),
    true = xor1(false,true),
    false = xor1(false,false),
    false = xor1(true,true),
    % test xor2/2
    true = xor2(true,false),
    true = xor2(false,true),
    false = xor2(false,false),
    false = xor2(true,true),
    % test xor3/2
    true = xor3(true,false),
    true = xor3(false,true),
    false = xor3(true,true),
    false = xor3(false,false),
    pass.


maxThree(A,B,C) ->
    max(max(A,B),C).

test_maxThree() ->
    2 = maxThree(0,1,2),
    -110 = maxThree(-234, -341, -110),
    4 = maxThree(0.54, 2#100, 3),
    pass.

howManyEqual(_X,_X,_X) ->
    3;
howManyEqual(_X,_X,_Y) ->
    2;
howManyEqual(_X,_Y,_Y) ->
    2;
howManyEqual(_X,_Y,_X) ->
    2;
howManyEqual(_,_,_) ->
    0.

test_howManyEqual() ->
    0 = howManyEqual(0,1,2),
    2 = howManyEqual(0,0,1),
    2 = howManyEqual(0,1,0),
    2 = howManyEqual(0,1,1),
    3 = howManyEqual(1,1,1),
    pass.

test() ->
    pass = test_xor(),
    pass = test_maxThree(),
    pass = test_howManyEqual().

