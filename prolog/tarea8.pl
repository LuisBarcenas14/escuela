%% Arboles en Prolog
dibuja(L):-
               new(P, picture('Arbol')),
               send(P, width(900)),
               send(P, height(600)),
               send(P, open),
               dibujaArbol(L,450,20,P).

dibujaArbol(arbol(N,nulo,nulo),X,Y,P):-
	send(P, display, text(N,center,normal),point(X+5,Y)).
dibujaArbol(arbol(N,nulo,D),X,Y,P):-
	Yp is Y + 60,
	escalad(X,Y,Xd),
	send(P, display, text(N,center,normal),point(X+5,Y)),
        send(P, display, new(_, line(X+8,Y+15,Xd+8,Yp,second))),
	dibujaArbol(D,Xd,Yp,P).
dibujaArbol(arbol(N,I,nulo),X,Y,P):-
	escalai(X,Y,Xi),
	Yp is Y + 60,
	send(P, display, text(N,center,normal),point(X+5,Y)),
	send(P, display, new(_, line(X+10,Y+15,Xi+8,Yp,second))),
	dibujaArbol(I,Xi,Yp,P).
dibujaArbol(arbol(N,I,D),X,Y,P):-
	escalai(X,Y,Xi),
        escalad(X,Y,Xd),
	Yp is Y + 60,
	send(P, display, text(N,center,normal),point(X+5,Y)),
        send(P, display, new(_, line(X+8,Y+15,Xd+8,Yp,second))),
	send(P, display, new(_, line(X+10,Y+15,Xi+8,Yp,second))),
	dibujaArbol(D,Xd,Yp,P),
        dibujaArbol(I,Xi,Yp,P).

escalai(X,Y,Z):-
        Z is X - (200 - Y/1.5).
escalad(X,Y,Z):-
        Z is X + (200 - Y/1.5).

%% Hasta aqui los predicados para dibujar un arbol

% El tercer argumento es el mayor de los primeros dos argumentos
max(X,Y,X):- X >= Y,!.
max(_,Y,Y).


% Encuentra el elemento de mas a la izquierda
extremoI(arbol(N,nulo,_),N).
extremoI(arbol(_,I,_),Ei):- extremoI(I,Ei).

% Encuentra el elemento de mas a la izquierda
extremoD(arbol(N,_,nulo),N).
extremoD(arbol(_,_,D),Ed):- extremoD(D,Ed).

% Encuentra el nivel de un arbol (-1 si es el arbol nulo)
nivelArbol(nulo,-1).
nivelArbol(arbol(_,Izq,Der),Nivel):-
	nivelArbol(Izq,Ni),
        nivelArbol(Der,Nd),
        max(Ni,Nd,N1),
        Nivel is N1 + 1.


% Ejemplo de un arbol para utilizarlo en los ejercicios
arbol(
     arbol(150,
        arbol(100,
            arbol(30,
              arbol(10,nulo,nulo),
              arbol(70,nulo,nulo)
            ),
            arbol(120,nulo,nulo)
        ),
        arbol(250,
            arbol(200,nulo,nulo),
            arbol(300,
                arbol(270,
                    arbol(260,nulo,nulo),
                    arbol(290,nulo,nulo)
                ),
                arbol(450,nulo,nulo)
            )
        )
     )
).

espejo(nulo,nulo).
espejo(arbol(R,Hi,Hd),arbol(R,Hd1,Hi1)):-espejo(Hd,Hd1),espejo(Hi,Hi1).

busca(N,arbol(N,_,_)).
busca(N,arbol(R,Hi,_)):-N<R,busca(N,Hi).
busca(N,arbol(R,_,Hd)):-N>R,busca(N,Hd).

inserta(N,nulo,arbol(N,nulo,nulo)).
inserta(N,arbol(N,Hi,Hd),arbol(N,Hi,Hd)).
inserta(N,arbol(R,Hi,Hd),arbol(R,Hi,Hd1)):-N>R,inserta(N,Hd,Hd1).
inserta(N,arbol(R,Hi,Hd),arbol(R,Hi1,Hd)):-N<R,inserta(N,Hi,Hi1).

%lista a arbol
listaToArbol(L, A):-listaToArbol(L, nulo, A).

listaToArbol([], A, A).
listaToArbol([H | T], A, NA):- inserta(H, A, A2), listaToArbol(T, A2, NA).  

%Convertir expresión a un'árbol
expToArbol((A+B), arbol(+, A1, B1)):-expToArbol(A, A1), expToArbol(B, B1).
expToArbol((A-B), arbol(-, A1, B1)):-expToArbol(A, A1), expToArbol(B, B1).
expToArbol((A*B), arbol(*, A1, B1)):-expToArbol(A, A1), expToArbol(B, B1).
expToArbol((A/B), arbol(/, A1, B1)):-expToArbol(A, A1), expToArbol(B, B1).
expToArbol(N, arbol(N, nulo, nulo)).

llenaArbol(0, nulo).
llenaArbol(N, arbol(N, A1, A1)):-N1 is div(N, 2), llenaArbol(N1, A1).

concatena([], L, L).
concatena([H | T], L, [H | C]):-concatena(T, L, C).

arbolToLista(nulo, []).
arbolToLista(arbol(R, Hi, Hd), L):-arbolToLista(Hi, Li), arbolToLista(Hd, Ld), concatena(Li, [R | Ld], L).

camino(N,arbol(N,_,_), [N]).
camino(N, arbol(R,Hi,_), [R | L]):-N<R, camino(N, Hi, L).
camino(N, arbol(R,_,Hd), [R | L]):-N>R, camino(N, Hd, L).
%camino(N, arbol(R,Hi,_), L):-N<R, camino(N, Hi, L1), concatena(R, L1, L).
%camino(N, arbol(R,_,Hd), L):-N>R, camino(N, Hd, L1), concatena(R, L1, L).

depthFirst(T, L):-dfs(T, L).

dfs(nulo,[]).
dfs(arbol(R, I, D), T):-dfs(I, L1), concatena([R],L1, L2), dfs(D, L3), concatena(L2, L3, T).


%bfs(_, [], []).
%bfs(nulo, [], []).
%bfs(arbol(R, I, D), [H1, H2 | T], R):-izq(I, H1), der(D, H2), bfs([], T, []).

breadthFirst(L, R):-bfs([L], R).

bfs([], []).
bfs([nulo | T], L):-bfs(T, L).
bfs([arbol(R, I, D) | T],  [R | T2]):-concatena(T, [I, D], L1), bfs(L1, T2).

izq(arbol(_, I, _), R):-raiz(I, R).
der(arbol(_, _, D), R):-raiz(D, R).
raiz(nulo, []).
raiz(arbol(R, _, _), R).

%abs(nulo,[]).
%abs(arbol(R,I,D), L):-abs(I,L1),abs(D,L2),concatena(L1,L2,L).


arbol2(T):-listaToArbol([17,12,5,15,8,115,32,163,30,46,57], T).

arbol3(
     arbol(a,
        arbol(b,
            arbol(d,
              arbol(h,nulo,nulo),
              arbol(i,nulo,nulo)
            ),
            arbol(e,
              arbol(j,nulo,nulo),
              arbol(k,nulo,nulo)
            )
        ),
        arbol(c,
            arbol(f,
              arbol(l,nulo,nulo),
              arbol(m,nulo,nulo)
            ),
            arbol(g,
              arbol(n,nulo,nulo),
              arbol(o,nulo,nulo)
            )
        )
     )
).
