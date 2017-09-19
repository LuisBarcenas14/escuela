concatena([], L, L).
concatena([H | T], L, [H | C]):-concatena(T, L, C).

longitud([], 0).
longitud([_ | T], S):-longitud(T, S1), S is (1 + S1).

encuentra(H, [], [H]).
encuentra(H, [H | _], []).
encuentra(N, [_ | T], S):-encuentra(N, T, S).

eliminaDuplicados([], []).
eliminaDuplicados([H1 | T1], L2):-encuentra(H1, T1, C), eliminaDuplicados(T1, S1), concatena(C, S1, L2).

invertir([X],[X]).
invertir([X|M],Z):-invertir(M,S), concatena(S,[X],Z).

generaLista2(0, []).
generaLista2(H, [H | T]):-H1 is H-1, H1>=0,generaLista2(H1, T).

generaLista(H, S):- generaLista2(H, S1), invertir(S1, S).

%combinaciones(L, N, C)
/*C es la lista de todas las combinaciones de elementos de la lista L
tomando N elementos.*/
/*
HASKELL
combina l n | (n==1) = [[x]|x<-l]
			| ((length l)==n) = [l]
			| otherwise = [(head l):xs | xs<-combina (tail l) (n-1)]
			  ++combina (tail l) n
*/
/*
comprension([], []).
comprension([H | T0],[ [H] | T]):-comprension(T0, T).
combinaciones(L1,1,C):-comprension(L1, C).
combinaciones(L1,N,[L1]):-longitud(L1, NL), N=NL.
combinaciones([H | T],N,S):- N1 is N-1, combinaciones(T, N1, S1), concatena(H, S1, C1), concatena(C1, _, S).
*/

combina(_, 0, []). 
combina([H | T], N, [H | T2]):-N1 is N-1, combina(T, N1, T2). 
combina([_ | T], N, L2):-combina(T, N, L2). 

combinaciones2(L, N, R):-findall(C,combina(L,N,C),R).
combinaciones(L, N, R):-combinaciones2(L, N, R1), eliminaDuplicados(R1, R).

 %N REINAS
nreinas(N,Sol):- generaLista(N,Tablero), permutar(Tablero,Sol), buenTablero(Sol).

permutar([],[]).
permutar(X,[C|Z]) :- seleccionar(X,C,R), permutar(R,Z).

seleccionar([X|R],X,R).
seleccionar([C|R],X,[C|Y]) :- seleccionar(R,X,Y).

buenTablero([]).
buenTablero([C|R]):- not(amenaza(C,R)), buenTablero(R).

amenaza(X,Prof,[C|_]):- X is C+Prof; X is C-Prof; X = C.
amenaza(X,Prof,[_|R]):- ProfMas1 is Prof + 1, amenaza(X,ProfMas1,R).

amenaza(_,[]):- fail.
amenaza(X,Y):- amenaza(X,1,Y).

reinas(N, R):-findall(S, nreinas(N, S), R).

%RESUELTAS POR EL PROFESOR

%esta en una lista
esta_en(G, [G | _]).
esta_en(G, [_ | T]):-esta_en(G, T).

eliminaDuplicadosP([], []).
eliminaDuplicadosP([H | T], D):-esta_en(H, T), eliminaDuplicadosP(T, D).
eliminaDuplicadosP([H | T], [H | D]):-not(esta_en(H, T)), eliminaDuplicadosP(T, D).

generaListaP(N, L):-generaListaP(N, [], L).
generaListaP(0, L, L).
generaListaP(N, L, L1):-N>0, N1 is N-1, generaListaP(N1, [N | L], L1).

combinacionP(L, 1, [H]):-esta_en(H, L).
combinacionP([H | T], N, [H | C]):-N > 1, N1 is N-1, combinacionP(T, N1, C).
combinacionP([_ | T], N, L2):-N > 1, combinacionP(T, N, L2).

combinacionesP(L , N, C):-findall(C1, combinacionP(L, N, C1), C).


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
