%assert (novios(juan, juanita)). %Agrega a la consola el predicado

%rectract(novios(juan, juanita)). % Elimina de la consola el prediado

%Manipulcación de simbolos


%novios(juan, ana)=..L.

%T=.. [f,a,b,c].

%atoms_chars(juana, L).

cuentaVocales(L, R):-atom_chars(L, Le), cuenta(Le, R).

v(a, 1).
v(e, 1).
v(i, 1).
v(o, 1).
v(u, 1).
v(_, 0).

cuenta([H], R):-v(H, R).
cuenta([H|T], R):-v(H, C), cuenta(T, R2),R is R2+C.

%quitaVocales([H], [H]):-v(H, 1).
%quitaVocales([H], [H]):-v(H, 1).
%quitaVocales([H], []):-v(H,0).
quitaVocales([], []).
quitaVocales([H | T], [H | T2]):-v(H, 0),quitaVocales(T, T2).
quitaVocales([H | T], T2):-v(H,1),quitaVocales(T, T2).

quitaVocalesR(T, C):-atom_chars(T, A), quita(A, X), atom_chars(C, X).
atomR(T, A):-atom_chars(T, A).

quita([], []).
quita([H | T], C):-v(H, 1), quita(T, C).
quita([H | T], [H | C]):-v(H, 0), quita(T, C).