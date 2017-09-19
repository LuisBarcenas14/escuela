%LISTAS EN PROLOG

%[1,2,3] = [H | I].

%Se pueden hacer listas de diferentes tipos de elementos.
%Ejemplo: [H | I]= [[1,2],1,2]

sumaLista([], 0).

sumaLista([H | T], S):- sumaLista(T, S1), S is H+S1.


%longitud 
longitud([], 0).
longitud([_ | T], S):-longitud(T, S1), S is (1 + S1).

%esta en una lista
esta_en(G, [G | _]).
esta_en(G, [_ | T]):-esta_en(G, T).

mayorDeDos(X, Y, X):-X>Y.
mayorDeDos(X, Y, Y):-X<Y.

mayor([E], E).
mayor([H | T], E):-mayor(T, E1), mayorDeDos(H, E1, E).

%concatena

concatena([], L, L).
concatena([H | T], L, [H | C]):-concatena(T, L, C).

rota(0, L, L):-!.
rota(N, [H | T], M):-N>0, N1 is N-1, concatena(T, [H], C), rota(N1, C, M).


%autómata
delta(q0, a, q0).
delta(q0, b, q0).
delta(q1, a, q2).
delta(q0, b, q1).
inicial(q0).
final(q2).

recorre(Q, [], Q).
recorre(Q, [H | T], QF):- delta(Q, H, QI), recorre(QI, T, QF).

acepta(L):- inicial(QI), final(QF),recorre(QI, L, QF).

%enesimo
%enesimo(3, [a,b,c,d,e], E).
enesimo(1, [H | _], H).
enesimo(N, [_ | T], E):- N>1, N1 is N-1, enesimo(N1, T, E).

%construye
construye(0, []).
construye(N, [N | L]):-N1 is N-1, construye(N1, L). 

%prefijo
prefijo([], _).
prefijo([H | T1], [H| T2]):-prefijo(T1, T2).

%prefijo No Determinista
%prefijo2([], _).
prefijo2(L1, L2):-concatena(L1, _, L2).

sufijo(L1, L2):-concatena(_, L1, L2).

%subLista([], L).
subLista(L1, L2):-sufijo(L1, X), prefijo2(X, L2).

%encuetra
%encuentra(_, [], 0).
encuentra(X, [_ | T], R):-encuentra(X, T, R1), R is (R1+1).
encuentra(X, [X | T], 1).

