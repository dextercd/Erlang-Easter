-module(easter).
-export([when_is_easter/1]).

-type year() :: integer().
-type month() :: 1..12.
-type day() :: 1..31.

-type date() :: {year(), month(), day()}.

-spec when_is_easter(year()) -> date().

when_is_easter(Year) ->
	A = Year rem 19,
	B = Year div 100,
	C = Year rem 100,
	D = B div 4,
	E = B rem 4,
	F = (B + 8) div 25,
	G = (B - F + 1) div 3,
	H = (19 * A + B - D - G + 15) rem 30,
	I = C div 4,
	K = C rem 4,
	L = (32 + 2 * E + 2 * I - H - K) rem 7,
	M = (A + 11 * H + 22 * L) div 451,
	Month = (H + L - 7 * M + 114) div 31,
	Day = ((H + L - 7 * M + 114) rem 31) + 1,
	{Year, Month, Day}.
