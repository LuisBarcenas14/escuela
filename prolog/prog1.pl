%CARGAR PROLOG swipl
%Cargar de nuevo el programa reconsult("prog1.pl")

hombre(juan).
hombre(pepe).
%en PROLOG es mortal(X):-hombre(X).
mortal(X):-hombre(X).

%Base de conocimientos
novios(juana, pancho).
novios(maria, luis).
novios(maria, juan).
novios(petra, alan).
novios(juana, hugo).
novios(ana, luis).
%novio de maria

%Lo que en lógica de predicados es VX (hombre(X) => mortal(X))
%en PROLOG es mortal(X):-hombre(X).

mujerInfiel(X):-novios(X, Y),novios(X, Z),Y\=Z.

hombreInfiel(X):-novios(Y, X),novios(Z, X),Y\=Z.

infiel(X):-mujerInfiel(X);hombreInfiel(X).

%UNIFICACIÓN EL MECANISMO QUE TIENE PROLOG PARA SABER SI DOS TÉRMINOS SON IGUALES
%Consiste en sustituir variables para hacer dos términos iguales

%2 términos unifican si son contantes o son iguales

mama(maria, juan).
mama(maria, pedro).
%mama(juan, maria)=mama(X, maria)

%g(X, Y) = g(3).
%Para que unifique el números de argumentos de un término debe ser el mismo que el de la otra parte.

%g(X, Y)=g(h(3,2)).

%A+B=3+2
%A+B=3*2+C

%A+B=3*(2+C).
%Regresa falso porque el funtor que esta fuera es una umtilplicación

%A*B=3+2*5

%3+2*5
%+(3, *(2,5))
