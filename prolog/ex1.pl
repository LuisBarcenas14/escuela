m1(E, [E | _], 0).
m1(E, [_ | T], N):-m1(E, T, N1), N is N1+1.

m2([], []).
m2([X, Y | T], [H | TL]):-H is X+Y, m2(T, TL).