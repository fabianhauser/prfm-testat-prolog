zeitslot('Mo', '08:00').
zeitslot('Mo', '09:00').
zeitslot('Di', '08:00').
zeitslot('Di', '09:00').

lektion('PrFm', zeitslot('Mo', '08:00')).
lektion('PrFm', zeitslot('Mo', '09:00')).
lektion('An2I', zeitslot('Mo', '08:00')).
lektion('An2I', zeitslot('Di', '08:00')).
lektion('CldInf', zeitslot('Mo', '08:00')).
%lektion('CldInf', zeitslot('Mo', '09:00')).
lektion('CldInf', zeitslot('Di', '08:00')).

stundenplan(Stundenplan):-
	stundenplan(
	  [ 'PrFm', 'An2I', 'CldInf' ],
	  Stundenplan
	).

stundenplan(Module, Stundenplan):-
	stundenplan(
	  [ zeitslot('Mo', '08:00'),
	    zeitslot('Mo', '09:00'),
	    zeitslot('Di', '08:00')],
	  Module, Stundenplan
	).

stundenplan(_, [], []).
stundenplan(
    ZeitList,
    [Modul|ModulList],
    [lektion(Modul,Zeit)|Stundenplan]
  ) :-
	member(Zeit, ZeitList),
	lektion(Modul, Zeit),
	delete(ZeitList, Zeit, NewZeitList),
	stundenplan(NewZeitList, ModulList, Stundenplan).

sortedStundenplan(Sorted):-
	stundenplan(S),
	sort(2,@=<, S, Sorted).
