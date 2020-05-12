-module(assignment).
-export([perimeter/1,area/1,bits/1]).

perimeter({circle, {_X,_Y}, R}) ->
    2*math:pi()*R;
perimeter({rectangle,H,W}) ->
    H*W;
perimeter({square,L}) ->
    math:pow(L,2);
perimeter({right_triangle,A,B}) ->
    A + B + math:sqrt(math:pow(A,2) + math:pow(B,2)); %calculating the hypotenuse
perimeter({triangle,A,B,C}) ->
    case is_valid(A,B,C) of
        false ->
            io:format("Invalid Triangle");
        true ->
            A+B+C
    end.

area({right_triangle,A,B}) ->
    A*B/2;
area({triangle,A,B,C}) ->
    case is_valid(A,B,C) of
        false ->
            io:format("Invalid Triangle");
        true ->
            S = (A+B+C)/2,
            math:sqrt(S*(S-A)*(S-B)*(S-C))
    end.

is_valid(A,B,C) when A+B>C, B+C>A, C+A>B ->
    true;
is_valid(_A,_B,_C) ->
    false.
% Tail recursive definition for converting to binary
convert_to_binary(0,List) ->
    List;
convert_to_binary(N,List) when N>0 -> 
    R = N rem 2,
    convert_to_binary(N div 2,[R|List]).

convert_to_binary(N) ->
    convert_to_binary(N, []).
% using the sum function of lists module to sum the integers in the list
bits(N) ->
    lists:sum(convert_to_binary(N)).

