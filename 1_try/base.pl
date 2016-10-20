timeslot(X):- member(X,['8:00','9:00']).
modul(X):- member(X,['PrFm','An2I']).
durchfuehrung(X):- member(X,['PrFmV1','PrFmV2','An2IV1','An2IV2']).

timeorder('08:00', 1).
timeorder('09:00', 2).
modulDurchfuehrung('PrFm', 'PrFmV1', '08:00').
modulDurchfuehrung('PrFm', 'PrFmV2', '09:00').
modulDurchfuehrung('An2I', 'An2IV1', '08:00').
modulDurchfuehrung('An2I', 'An2IV2', '09:00').

stundenplan(lektion(Slot1, Durchfuehrung1), lektion(Slot2, Durchfuehrung2)):-
	modul(Modul1),
	modul(Modul2),
	Modul1 \= Modul2,
	modulDurchfuehrung(Modul1, Durchfuehrung1, Slot1),
	modulDurchfuehrung(Modul2, Durchfuehrung2, Slot2),
	Slot1 \= Slot2,
	timeorder(Slot1, Order1),
	timeorder(Slot2, Order2),
	Order1 < Order2.
