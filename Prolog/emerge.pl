partirI([],[],[]).
partirI([H|T],[H|I],D) :- partirD(T,I,D).
partirD([],[],[]).
partirD([H|T],I,[H|D]):- partir(T,I,D).
partir(A,B,C) :- partirI(A,B,C).

fusion(L,[],L).
fusion([],L,L).
fusion([H|T],[H2|T2],[H|L]) :- H < H2, fusion(T, [H2|T2], L).
fusion([H|T],[H2|T2],[H2|L]) :- H2 =< H, fusion([H|T],T2,L).

merge([],[]).
merge([H],[H]).
merge(L,O) :- partir(L,I,D), merge(I, IO), merge(D, DO), fusion(IO, DO, O).

