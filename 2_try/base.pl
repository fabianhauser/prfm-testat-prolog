timeslot('Mo08:00').
timeslot('Mo09:00').
timeorder('Mo08:00', 1).
timeorder('Mo09:00', 2).
modul('PrFm').
modul('An2I').
durchfuehrung('PrFmV1').
durchfuehrung('PrFmV2').
durchfuehrung('An2IV1').
durchfuehrung('An2IV2').
modulDurchfuehrung('PrFm', 'PrFmV1', 'Mo08:00').
modulDurchfuehrung('PrFm', 'PrFmV2', 'Mo09:00').
modulDurchfuehrung('An2I', 'An2IV1', 'Mo08:00').
modulDurchfuehrung('An2I', 'An2IV2', 'Mo09:00').

stundenplan([], [], _).
stundenplan(
    ZeitList,
    [Modul|StrikeList],
    [lektion(Modul,Zeit)|LektionList]
  ) :-
	member(Zeit, _ZeitList),
	modulDurchfuehrung(Modul, _, Zeit),
	modul(Modul),
	timeslot(Zeit),
	delete(ZeitList, Zeit, NewZeitList),
	stundenplan(NewZeitList, StrikeList, LektionList).
