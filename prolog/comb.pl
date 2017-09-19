esta_en(G, [G | _]).
esta_en(G, [_ | T]):-esta_en(G, T).

esta_en2([], _, []).
esta_en2([H0 | _], L2, L2):-esta_en(H0, L2).
esta_en2([H0 | T0], L2, R):-not(esta_en(H0, L2)), esta_en2(T0, L2, R).
%esta_en2([H0 | T0], [_ | T], ):-esta_en(H0, T).


esta_en3(_, [], []).
esta_en3(L1, [H | T], [H | R]):-esta_en2(L1, H, H), esta_en3(L1, T, R).
esta_en3(L1, [H | T], R):-not(esta_en2(L1, H, H)), esta_en3(L1, T, R).

esta_enb(_, [], 0).
esta_enb(G, [G | T], R):-esta_enb(G, T, R1), R is R1+1.
esta_enb(G, [_ | T], R):-esta_enb(G, T, R).

esta_en2b([], _, 0).
esta_en2b([H0 | T], L2, R):-esta_enb(H0, L2, X), esta_en2b(T, L2, R1), R is R1+X.

esta_en3b(_, [], 0).
esta_en3b(L1, [H | T], R):-esta_en2b(L1, H, R1), esta_en3b(L1, T, R2), R is R1+R2.

longitud([], 0).
longitud([_ | T], S):-longitud(T, S1), S is (1 + S1).

combinacionP(L, 1, [H]):-esta_en(H, L).
combinacionP([H | T], N, [H | C]):-N > 1, N1 is N-1, combinacionP(T, N1, C).
combinacionP([_ | T], N, L2):-N > 1, combinacionP(T, N, L2).

combinacionesP(L , N, C):-findall(C1, ( between(1, N, I), combinacionP(L, I, C1) ), C).

generaLista2(I, N, L):-N1 is N-1,generaLista2(I, N1, [], L).
generaLista2(I, I1, L, L):-I1 is I-1.
generaLista2(I, N, L, L1):-N>=I, N1 is N-1, generaLista2(I, N1, [N | L], L1).

frog(L, X, Y, R):-generaLista2(X, Y, L1), N is Y-X,combinacionesP(L1, N, C), esta_en3b(L, C, R). 