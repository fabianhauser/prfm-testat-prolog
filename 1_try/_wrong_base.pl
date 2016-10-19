%Modules
modul('An2I').
modul('PrFm').

%Durchführung
%%An2I
%durchfuerung('V1','An2I'):-
%  timeslot(8, mo),
%  timeslot(9, mo).
%durchfuerung('V2','An2I'):-
%  timeslot(8, di),
%  timeslot(9, di).
%%%PrFm
%durchfuerung('V1','PrFm'):-
%  timeslot(8, mo),
%  timeslot(9, mo).
%durchfuerung('V2','PrFm'):-
%  timeslot(8, di),
%  timeslot(9, di).

%Timeslots
timeslot(8, mo):-
  durchfuerung('V1', 'PrFm');
  durchfuerung('V1', 'An2I').
timeslot(9, mo):-
  durchfuerung('V1', 'PrFm');
  durchfuerung('V1', 'An2I').
timeslot(8, di):-
  durchfuerung('V2', 'PrFm');
  durchfuerung('V2', 'An2I').
timeslot(9, di):-
  durchfuerung('V2', 'PrFm');
  durchfuerung('V2', 'An2I').



%Timetable
%timetable():-
  
%  modul(Modul),
%  durchfuerung(Durchfuerung,Modul)
