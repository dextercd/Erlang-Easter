-module(easter).
-export([when_is_easter/1]).

-type year() :: integer().
-type month() :: 1..12.
-type day() :: 1..31.

-type date() :: {year(), month(), day()}.

-spec when_is_easter(year()) -> date().

-type non_zero_integer() :: pos_integer() | neg_integer().

-spec divrem(Numerator :: integer(), Denominator :: non_zero_integer()) ->
	{integer(), integer()}.

divrem(Num, Den) ->
	{Num div Den, Num rem Den}.

when_is_easter(Year) ->
	A = Year rem 19,
	{B, C} = divrem(Year, 100),
	{D, E} = divrem(B, 4),
	G = (8 * B + 13) div 25,
	H = (19 * A + B - D - G + 15) rem 30,
	{I, K} = divrem(C, 4),
	L = (2 * E + 2 * I - H - K + 32) rem 7,
	M = (A + 11 * H + 19 * L) div 433,
	Month = (H + L - 7 * M + 90) div 25,
	Day = (H + L - 7 * M + 33 * Month + 19) rem 32,
	{Year, Month, Day}.
