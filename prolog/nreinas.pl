concatena([], L, L).
concatena([H | T], L, [H | C]):-concatena(T, L, C).

invertir([X],[X]).
invertir([X|M],Z):-invertir(M,S), concatena(S,[X],Z).

generaLista2(0, []).
generaLista2(H, [H | T]):-H1 is H-1, H1>=0,generaLista2(H1, T).

generaLista(H, S):- generaLista2(H, S1), invertir(S1, S).

%n reinas profe
quitaUno(E, [E | T], T).
quitaUno(E, [H | T], [H | L]):-quitaUno(E, T, L).

permuta([], []).
permuta(L, [H | P]):-quitaUno(H, L, T), permuta(T, P).

reina([], []).
reina(L, [H| P]):-quitaUno(H, L, T), reina(T, P), noAtaca(H, P, 1).

noAtaca(_, [], _).
noAtaca(R, [Reina | Reinas], DH):-abs(R- Reina) =\= DH, DH1 is DH+1, noAtaca(R, Reinas, DH1).

reinasP(N, L):-generaLista(N, R1), findall(R2, reina(R1, R2), L).
