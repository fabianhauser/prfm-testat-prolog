modulDurchfuehrung('PrFm', 'PrFmV1', 'Mo08:00').
modulDurchfuehrung('PrFm', 'PrFmV2', 'Mo09:00').
modulDurchfuehrung('An2I', 'An2IV1', 'Mo08:00').
modulDurchfuehrung('An2I', 'An2IV2', 'Mo10:00').
modulDurchfuehrung('CldInf', 'CldInfV1', 'Mo08:00').
%modulDurchfuehrung('CldInf', 'CldInfV2', 'Mo09:00').
modulDurchfuehrung('CldInf', 'CldInfV2', 'Mo10:00').

stundenplan(Module, Stundenplan):- stundenplan(['Mo08:00','Mo09:00','Mo10:00'], Module, Stundenplan).

stundenplan(_, [], []).
stundenplan(
    ZeitList,
    [Modul|ModulList],
    [lektion(Modul,Zeit)|Stundenplan]
  ) :-
	member(Zeit, ZeitList),
	modulDurchfuehrung(Modul, _, Zeit),
	delete(ZeitList, Zeit, NewZeitList),
	stundenplan(NewZeitList, ModulList, Stundenplan).

