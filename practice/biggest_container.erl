-module(biggest_container).
-export([area/1]).

area(Area, {Left, Right}, List) when Left < Right ->
    LeftElement = lists:nth(Left, List),
    RightElement = lists:nth(Right, List),
    Newarea = max(Area, min(LeftElement, RightElement)*(Right - Left)),
    {NewLeft, NewRight} = case LeftElement < RightElement of
                              false ->
                                  {Left, Right - 1};
                              true ->
                                  {Left + 1, Right}
                          end,
    area(Newarea,{NewLeft, NewRight}, List);
area(Area, {_Left,_Right},_List) ->
    Area.

area(List) ->
    area(0,{1,length(List)}, List).
