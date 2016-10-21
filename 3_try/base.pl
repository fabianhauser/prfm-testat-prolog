zeitslot(Tag, Zeit):- zeitslot(_, Tag, Zeit).
zeitslot(1, 'Mo', '08:00').
zeitslot(2, 'Mo', '09:00').
zeitslot(3, 'Di', '08:00').
zeitslot(4, 'Di', '09:00').


lektion('PrFm', zeitslot('Mo', '08:00')).
lektion('PrFm', zeitslot('Mo', '09:00')).
lektion('An2I', zeitslot('Mo', '08:00')).
lektion('An2I', zeitslot('Di', '08:00')).
lektion('CldInf', zeitslot('Mo', '08:00')).
lektion('CldInf', zeitslot('Di', '08:00')).

stundenplan(Stundenplan):-
	stundenplan(
	  [ 'PrFm', 'An2I', 'CldInf' ],
	  Stundenplan
	).

stundenplan(Module, Stundenplan):-
	stundenplan(
	  [ zeitslot(1, 'Mo', '08:00'),
	    zeitslot(2, 'Mo', '09:00'),
	    zeitslot(3, 'Di', '08:00')],
	  Module, Stundenplan
	).

stundenplan(_, [], []).
stundenplan(
    ZeitList,
    [Modul|ModulList],
    [lektion(Modul,zeitslot(NR, Tag, Zeit))|Stundenplan]
  ) :-
	member(zeitslot(NR, Tag, Zeit), ZeitList),
	lektion(Modul, zeitslot(Tag, Zeit)),
	delete(ZeitList, zeitslot(NR, Tag, Zeit), NewZeitList),
	stundenplan(NewZeitList, ModulList, Stundenplan).

sortedStundenplan(Sorted):-
	stundenplan(S),
	sort(2,@=<, S, Sorted).
