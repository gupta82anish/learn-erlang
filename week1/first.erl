
-module(first).
-export([double/1, mult/2,area/3, area_of_right_triangle/2, perimeter/2, hyplength/2]).

mult(X,Y) ->
    X*Y.

double(X) ->
    mult(2,X).

area(A,B,C) ->
    S = (A+B+C)/2,
    math:sqrt(S*(S-A)*(S-B)*(S-C)).

square(X) ->
    math:pow(X,2).


hyplength(A,B) ->
    math:sqrt(square(A)+ square(B)).

area_of_right_triangle(A,B) ->
    A*B/2.

perimeter(A,B) ->
    A+B+hyplength(A,B).

