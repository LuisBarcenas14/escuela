/* Reconocimiento de personajes. Para ejecutar el programa:
                               ?- reconoce.                      */

reconoce :- hipotesis(Personaje),
      write('El personaje es : '),
      write(Personaje),
      nl,
      limpia_BC.

/* hipotesis que se intentarán demostrar */
hipotesis(chabelo)	:- chabelo, !.
hipotesis(el_santo)	:- el_santo, !.
hipotesis(chicharito)	:- chicharito, !.
hipotesis(mafalda)	:- mafalda, !.
hipotesis(peter_pan)	:- peter_pan, !.
hipotesis(el_principito)	:- el_principito, !.
hipotesis(superman)	:- superman, !.
hipotesis(desconocido). /* ??? */

/* reglas para identificar personajes */
chabelo :-	paisano, infante,
		verificar(es_inmortal).
chicharito :- deportista, 
		verificar(sale_en_comerciales_de_CarlosV).
el_santo :-	deportista,
		verificar(peleo_contra_las_momias).
mafalda :-	infante, historieta, verificar(detesta_la_sopa).
peter_pan :-	infante, volador, literario, 
		verificar(tiene_un_hada).
el_principito :-	infante, marciano, literario,
		verificar(tiene_un_amigo_aviador).
superman :-	marciano, volador, historieta,
		verificar(su_debilidad_es_la_Kryptonita).


/* Reglas de Clasificacion */
paisano    :-	verificar(es_mexicano), !.
infante   :-	verificar(usa_ropa_de_ninio), !.
infante    :-	verificar(es_curioso).
volador   :-	verificar(puede_volar), !.
volador   :-	verificar(puede_flotar).
marciano :-	verificar(viene_de_otro_planeta), !.
marciano :-	verificar(viene_de_una_estrella),
		verificar(viene_de_un_asteroide).
literario :-	verificar(aparece_en_un_cuento), !.
literario :-	verificar(aparece_en_una_novela).

historieta :-   verificar(aparece_en_una_historieta).

deportista :-   verificar(es_jugador_de_futbol),!.
deportista :-    verificar(es_luchador).

/* Pregunta al usuario */
pregunta(Atributo) :-
    write('El personaje '),
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
