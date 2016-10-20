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

%durchFuerungUm(Zeit, Modul):- modulDurchfuerung(Modul, , Zeit).



stundenplan([],SortedModules,_):- sort(SortedModules, ['An2I','PrFm']).

stundenplan([Zeit|Ze],Strikes,[lektion(Modul,Zeit)|Mp]) :-
	write(Strikes),
	modul(Modul),
	timeslot(Zeit),
	modulDurchfuehrung(Modul, _, Zeit),
%	\+ member(lektion(Modul, _),Md),
%	member(Zeit,Ze),
	append(Strikes,Modul,NewStrikes),
	stundenplan(Ze,NewSortedStrikes,Mp).

%stundenplan(Stun):- stundenplan(1,Stun).

%stundenplan(T,Stun):-
%	modul(Modul1),
%	modul(Modul2),
%	Modul1 \= Modul2,
%	modulDurchfuehrung(Modul1, Durchfuehrung1, Slot1),
%	modulDurchfuehrung(Modul2, Durchfuehrung2, Slot2),
%	Slot1 \= Slot2,
%	timeorder(Slot1, T),
%	timeorder(Slot2, Order2),
%	T < Order2,
%	stundenplan(T+1, Stun),
%	append(Stun, lektion(T, Durchfuhrung1));
%	not(timeorder(,T)).

%stundenplan(lektion(Slot1, Durchfuehrung1), lektion(Slot2, Durchfuehrung2)):-
%	modul(Modul1),
%	modul(Modul2),
%	Modul1 \= Modul2,
%	modulDurchfuehrung(Modul1, Durchfuehrung1, Slot1),
%	modulDurchfuehrung(Modul2, Durchfuehrung2, Slot2),
%	Slot1 \= Slot2,
%	timeorder(Slot1, Order1),
%	timeorder(Slot2, Order2),
%	Order1 < Order2.
