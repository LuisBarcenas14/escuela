% solve( Node, Solution):
%    Solution is an acyclic path (in reverse order) between Node and a goal

solve( Node, Solution)  :-
  depthfirst( [], Node, Solution).

% depthfirst( Path, Node, Solution):
%   extending the path [Node | Path] to a goal gives Solution

depthfirst( Path, Node, [Node | Path] )  :-
   goal( Node).

depthfirst( Path, Node, Sol)  :-
  s( Node, Node1),
  not(member( Node1, Path)),                % Prevent a cycle
  depthfirst( [Node | Path], Node1, Sol).

%goal(Situation) is true if Situation is a final node of the search space
%goal(L):-L=[' ',1,2,3,4,5,6,7,8]. %board(' ',1,2,3,4,5,6,7,8).
goal(L):-L=board(' ',1,2,3,4,5,6,7,8). %board(' ',1,2,3,4,5,6,7,8).

%Sucesor relation for the blocks world problem. Takes
%Top1 from Stack1 and puts it on top of Stack2.
%s([[H|T],B,C],[T,[H|B],C]).
%s(board(A,B,C,D,E,F,G,H,' '), board(A,B,C,D,E,F,G,' ',H).
%s(board(A,B,C,D,E,F,G,H,' '), board(A,B,C,D,E,' ',G,H,F).

%CONFIGURACIONES
%1
s(board(' ',A,B,C,D,E,F,G,H), board(A,' ',B,C,D,E,F,G,H)).
s(board(' ',A,B,C,D,E,F,G,H), board(C,A,B,' ',D,E,F,G,H)).
%2
s(board(A,' ',B,C,D,E,F,G,H), board(' ',A,B,C,D,E,F,G,H)).
s(board(A,' ',B,C,D,E,F,G,H), board(A,D,B,C,' ',E,F,G,H)).
s(board(A,' ',B,C,D,E,F,G,H), board(A,B,' ',C,D,E,F,G,H)).
%3
s(board(A, B, ' ', C, D, E, F, G, H), board(A, ' ', B, C, D, E, F, G, H)).
s(board(A, B, ' ', C, D, E, F, G, H), board(A, B, E, C, D, ' ', F, G, H)).
%4
s(board(A, B, C, ' ', D, E, F, G, H), board(' ', B, C, A, D, E, F, G, H)).
s(board(A, B, C, ' ', D, E, F, G, H), board(A, B, C, D, ' ', E, F, G, H)).
s(board(A, B, C, ' ', D, E, F, G, H), board(A, B, C, F, D, E, ' ', G, H)).
%5
s(board(A, B, C, D, ' ', E, F, G, H), board(A, ' ', C, D, B, E, F, G, H)).
s(board(A, B, C, D, ' ', E, F, G, H), board(A, B, C, ' ', D, E, F, G, H)).
s(board(A, B, C, D, ' ', E, F, G, H), board(A, B, C, D, E, ' ', F, G, H)).
s(board(A, B, C, D, ' ', E, F, G, H), board(A, B, C, D, G, E, F, ' ', H)).
%6
s(board(A, B, C, D, E, ' ', F, G, H), board(A, B, ' ', D, E, C, F, G, H)).
s(board(A, B, C, D, E, ' ', F, G, H), board(A, B, C, D, ' ', E, F, G, H)).
s(board(A, B, C, D, E, ' ', F, G, H), board(A, B, C, D, E, H, F, G, ' ')).
%7
s(board(A, B, C, D, E, F, ' ', G, H), board(A, B, C, ' ', E, F, D, G, H)).
s(board(A, B, C, D, E, F, ' ', G, H), board(A, B, C, D, E, F, G, ' ', H)).
%8
s(board(A, B, C, D, E, F, G, ' ', H), board(A, B, C, D, E, F, ' ', G, H)).
s(board(A, B, C, D, E, F, G, ' ', H), board(A, B, C, D, ' ', F, G, E, H)).
s(board(A, B, C, D, E, F, G, ' ', H), board(A, B, C, D, E, F, G, H, ' ')).
%9
s(board(A, B, C, D, E, F, G, H, ' '), board(A, B, C, D, E, ' ', G, H, F)).
s(board(A, B, C, D, E, F, G, H, ' '), board(A, B, C, D, E, F, G, ' ', H)).

%*/
%s([A,' ',B,C,D,E,F,G,H], [' ',A,B,C,D,E,F,G,H]).
%s([A,' ',B,C,D,E,F,G,H], [A,D,B,C,' ',E,F,G,H]).
%s([A,' ',B,C,D,E,F,G,H], [A,B,' ',C,D,E,F,G,H]).

del(X,[X|L],L).
del(X,[Y|L],[Y|L1]):-
   del(X,L,L1).

%Breadth first search
solve2(Start,Solution):-
  breadthfirst([[Start]],Solution).
breadthfirst([[Node|Path]|_],[Node|Path]):-
  goal(Node).
breadthfirst([[N|Path]|Paths],Solution):-
   bagof([M,N|Path],(s(N,M),not(member(M,[N|Path]))),NewPaths),
   concatena(Paths,NewPaths,Paths1),!,
   breadthfirst(Paths1,Solution);
   breadthfirst(Paths,Solution).
  
  concatena([],L,L).
  concatena([H|T],L,[H|T1]):-
      concatena(T,L,T1).

writeL([]).
writeL([H|T]):-
     write(H),
     write('\n'),
     writeL(T).


writeSol([]).
writeSol([board(A,B,C,D,E,F,G,H,I)|T]):-
write(A),write(B),write(C),write('\n'),
write(D),write(E),write(F),write('\n'),
write(G),write(H),write(I),write('\n'),
write('\n'),
writeSol(T).

eightPuzzle(Start):-solve2(Start, Sol), reverse(Sol, Sol1), writeSol(Sol1).%, writeSol(Sol, Solution).


