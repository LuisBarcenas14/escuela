/* Reconocimiento de animales. Para ejecutar el programa:
                               ?- reconoce.                      */

reconoce :- hipotesis(Animal),
      write('El animal es : '),
      write(Animal),
      nl,
      limpia_BC.

/* hipotesis que se intentarán demostrar */
hipotesis(guepardo)	:- guepardo, !.
hipotesis(tigre)	:- tigre, !.
hipotesis(girafa)	:- girafa, !.
hipotesis(zebra)	:- zebra, !.
hipotesis(avestruz)	:- avestruz, !.
hipotesis(pinguino)	:- pinguino, !.
hipotesis(albatros)	:- albatros, !.
hipotesis(desconocido). /* ??? */

/* reglas para identificar animales */
guepardo :-	mamifero,
		carnivoro,
		verificar(tiene_color_cafe),
		verificar(tiene_manchas_negras).
tigre :-	mamifero,
		carnivoro,
		verificar(tiene_color_cafe),
		verificar(tiene_lineas_negras).
girafa :-	tiene_cascos,
		verificar(tiene_cuello_largo),
		verificar(tiene_patas_largas).
zebra :-	tiene_cascos,
		verificar(tiene_lineas_negras).
avestruz :-	ave,
		verificar(no_vuela),
		verificar(tiene_cuello_largo).
pinguino :-	ave,
		verificar(no_vuela),
		verificar(nada),
		verificar(es_blanco_y_negro).
albatros :-	ave,
		verificar(aparece_en_historias_de_marinos),
		verificar(vuela_bien).

/* Reglas de Clasificacion */
mamifero    :-	verificar(tiene_pelo), !.
mamifero    :-	verificar(produce_leche).
ave   :-	verificar(tiene_plumas), !.
ave   :-	verificar(vuela),
		verificar(pone_huevos).
carnivoro :-	verificar(come_carne), !.
carnivoro :-	verificar(tiene_dientes_puntiagudos),
		verificar(tiene_garras),
		verificar(tiene_ojos_frontales).
tiene_cascos :- mamifero,
                verificar(tiene_pezuñas), !.
tiene_cascos :- mamifero,
                verificar(mastica_papilla).

/* Pregunta al usuario */
pregunta(Atributo) :-
    write('El animal '),
    write(Atributo),
    write('? '),
    read(Respuesta),
    nl,
    ( (Respuesta == si ; Respuesta == s)
      ->
       assert(si(Atributo)) ;
       assert(no(Atributo)), fail).

:- dynamic si/1,no/1.

/* Verifica si algo es cierto */
verificar(S) :-
   (si(S) -> true ; (no(S)-> fail ; pregunta(S))).

/* limpia la base de conocimiento */
limpia_BC :- retract(si(_)),fail.
limpia_BC :- retract(no(_)),fail.
limpia_BC.
