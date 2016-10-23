% Interest Base Project In Prolog
% Participants: Raphael Zimmermann, Fabian Hauser, Muriele Trentini
% Project: We would like to explore how Prolog can be used to create a class schedule for students.

% use with swish [ http://swish.swi-prolog.org/ ] to render a nice table
:- use_rendering(table,
		 [header(lektion('Modul', 'Zeitslot'))]).


% All empty TimeSlots i.e. the week
zeitslot(Tag, Zeit):- zeitslot(_, Tag, Zeit).
zeitslot(1, 'Mo', '08:00').
zeitslot(2, 'Mo', '09:00').
zeitslot(3, 'Di', '08:00').
zeitslot(4, 'Di', '09:00').

% All available courses
lektion('PrFm', zeitslot('Mo', '08:00')).
lektion('PrFm', zeitslot('Mo', '09:00')).
lektion('An2I', zeitslot('Mo', '08:00')).
lektion('An2I', zeitslot('Di', '08:00')).
lektion('CldInf', zeitslot('Mo', '08:00')).
lektion('CldInf', zeitslot('Di', '08:00')).

allLektionen(Lektionen):-
	findall(L, lektion(L,_), LektionenBag),
	sort(LektionenBag, Lektionen).

allZeitslot(Zeitslots):-
	findall(zeitslot(X,Y,Z), zeitslot(X,Y,Z), ZeitslotsBag),
	sort(ZeitslotsBag, Zeitslots).

% stundenplan with different arities for convenient queries
stundenplan(Stundenplan):-
	allLektionen(Lektionen), 
	stundenplan(
	  Lektionen,
	  Stundenplan
	).

stundenplan(Module, Stundenplan):-
	allZeitslot(Zeitslots),
	stundenplan(
	  Zeitslots, Module, Stundenplan
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
	sort(2, @=<, S, Sorted).

/* query-examples:
	sortedStundenplan(Sorted).
	stundenplan(['PrFm', 'An2I'], Stundenplan).	
	allLektionen(Lektionen).
*/
