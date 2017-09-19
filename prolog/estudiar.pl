misterio2(0, 0).
misterio2(N, R):-N0 is N-1, misterio1(N0, R1), R is R1+R1.

sumatoria(0, 0).
sumatoria(N, R):-N0 is N-1, sumatoria(N0, R1), R is N+R1. 

misterio3(0, 0, 0).
misterio3(N, M, R):-C is N*M, N1 is N-1, M1 is M-2, misterio3(N1, M1, R1), R is C+R1.

misterio4(N, 0):-N<2.
misterio4(N, R):-N1 is N-2, misterio4(N1, R1), R is R1+1.

delta(q0, a, q0).
delta(q0, b, q0).
delta(q0, a, q1).
delta(q1, b, q2).
delta(q2, b, q3).
inicial(q0).
final(q3).

recorre(Q, [], Q).
recorre(Q, [H | T], QF):-delta(Q, H, QI), recorre(QI, T, QF).
acepta(L):-inicial(QI), final(QF), recorre(QI, L, QF).

misterio1p([], [], []).
misterio1p([H1 | T1], [H2 | T2], [pareja(H1, H2) | Tt]):-
	misterio1p(T1, T2, Tt).

puntos(_, [], []). 
puntos([], _, []). 
puntos([H1 | T1], [H2 | T2], [punto(H1, H2) | Tt]):-
	puntos(T1, T2, Tt).

numerosGrandes([], []).
numerosGrandes([H | T], [H | Tt]):-H>100, numerosGrandes(T, Tt).
numerosGrandes([H | T], Tt):- H=<100, numerosGrandes(T, Tt).


mayor10(N):-N>11; N=11.

delta2(q0, a, q0).
delta2(q0, b, q0).
delta2(q0, a, q1).
delta2(q1, a, q1).
delta2(q1, b, q2).
delta2(q2, a, q3).
inicial2(q0).
final2(q3).

recorre2(Q, [], Q).
recorre2(Q, [H | T], QF):-delta2(Q, H, QI), recorre2(QI, T, QF).

acepta2(L):-inicial2(QI), final2(QF), recorre2(QI, L, QF).

concatena([], L, L).
concatena([H | T], L, [H | T2]):-concatena(T, L, T2).

longitud([], 0).
longitud([_ | T], R):-longitud(T, R1), R is R1+1.

encuentra(N, [_ | T], R):-encuentra(N, T, R1), R is R1+1.
encuentra(N, [N | _], 1).

escalera(N, L):-escalera(1, N, L).

escalera(N, 1, [N]):-!.
escalera(I, N, [I | T]):- N>1, N1 is N-1, I1 is I+1, escalera(I1, N1, T).

ordena([], []).
ordena([H| T], L):-T is [H2 | T2], H2<H, ordena(T2, L1), concatena(L1, [H], L). 
%ordena([H| T], L):-T is [H2 | _], H2>=H, ordena(T, L1), concatena([H], L1, L). 


