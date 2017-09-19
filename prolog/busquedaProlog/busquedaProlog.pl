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
goal(Situation):-
  member([a,b,c],Situation).

%Sucesor relation for the blocks world problem. Takes
%Top1 from Stack1 and puts it on top of Stack2.
s([[H|T],B,C],[T,[H|B],C]).
s([[H|T],B,C],[T,B,[H|C]]).
s([A,[H|T],C],[[H|A],T,C]).
s([A,[H|T],C],[A,T,[H|C]]).
s([A,B,[H|T]],[[H|A],B,T]).
s([A,B,[H|T]],[A,[H|B],T]).

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

