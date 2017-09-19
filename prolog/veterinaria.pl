%Hechos.
%
%
%chuchita es un perro enfermo de parvuvirus.
%monica es un perro enfermo de hepatitis.
%firulais es un perro enfermo de parasitosis.
%andrey es un perro enfermo de sarna.
%robin es un  perro enfermo de moquillo.
%choco es un perro enfermo de hepatitis.
%duke es un perro enfermo de sarna.
%
%diarrea con sangre es un sintoma de parvuvirus.
%coloramarillo es un sintoma de hepatitis.
%vomitar parasitos es un sintoma de parasitosis.
%
%denosyl es la medicina que cura el sintoma color amarillo.
%desparasitante es la medicina que cura el sintoma vomitar parasitos.
%fluidoterapia es la medicina que cura el sintoma diarrea con sangre.
%
%perro es andrey.
%perro es monica.
%perro es chuchita.
%perro es choco.
%
%drGonzalo es un doctor veterinario.
%drElena es un doctor veterinario.
%candelaria es un doctor veterinario.
%
%hembra es monica.
%hembra es chuchita.
%
%
%ADEMAS podemos aportar el siguiente conocimiento inferido.
%
%
%La medicina cura una enfermedad si la enfermedad tiene un síntoma que
%que cure la medicina.
%
% un perro debe tomar una medicina si tiene una enfermedad que la cure la
% medicina.
%
% A un perro se le asigna  un doctor.
%
% Dos perros son hembras.
%
% algunos perros comparten el mismo sintoma.
%
%-------------------------------MIO DE MIRIAN
es_perroenfermo(chuchita,parvuvirus).
es_perroenfermo(monica,hepatitis).
es_perroenfermo(firulais,parasitosis).
es_perroenfermo(andrey,sarna).
es_perroenfermo(robin,moquillo).
es_perroenfermo(choco,hepatitis).
es_perroenfermo(duke,sarna).

sintoma(diarreaconsangre,parvuvirus).
sintoma(diarreaconsangre,sarna).
sintoma(coloramarillo,hepatitis).
sintoma(vomitarparasitos,parasitosis).
sintoma(estornudo,moquillo).

cura_sintoma(desparasitante,vomitarparasitos).
cura_sintoma(denosyl,coloramarillo).
cura_sintoma(fluidoterapia,diarreaconsangre).
cura_sintoma(aderogil, estornudo).

%cura_enfer(parvuvirus,fluidoterapia2).
%cura_enfer(hepatitis,transplante).
%cura_enfer(parasitos,desparacitante).
%cura_enfer(sarna,asuntol).
%cura_enfer(moquillo,ampicilina).

perro(andrey).
perro(monica).
perro(chuchita).
perro(choco).

doctorveterinario(drgonzalo).
doctorveterinario(drelena).
doctorveterinario(candelaria).

hembra(monica).
hembra(chuchita).
%--------------------------FIN DE LO DE MIRIAN-------
%
%
%
%
%---------------------------------ALGUNAS CONSULTAS---------------------
%
%¿existe una medicina que cure una enfermedad?          cura_enfer(parvuvirus,fluidoterapia).
%¿un perro enfermo que medicina debe tomar?             debetomarmedicina(monica,denosyl).
%¿Hay perros que tengan la misma enfermedad?          alg_enfermedadcompartida(monica,choco,hepatitis).
%¿Que paciente canino tiene un determinado doctor?      confirmaelpacientealdoctor(andrey,drgonzalo).
%¿Dos perros son hembras?				sonhembraselperro(chuchita,monica).
% ¿que perros comparten el mismo sintoma?               compartensintoma(monica,choco,coloramarillo).
%
%
%
% ------REGLAS----
%
% 2 REGLAS AND
%
% La siguiente regla nos indica que medicina debe tomar un perro,
% Enfemedad nos indica la enfermedad del perro, Medicina nos indica el
% medicamento para esa enfermedad.
% La prueva prolog curaEnf(parvuvirus,fluidoterapia). da como resultado
% TRUE porque la medicina contra el palvuvirus es la fluidoterapia.
%
 cura_enfer(Enfermedad,Medicina):-sintoma(Sintoma,Enfermedad),cura_sintoma(Medicina,Sintoma).
%
%
% La regla debetomarmedicina indica que la variable Perro es el nombre
% del perro y que le corresponde de acuerdo a la curaEnf(cura de la
% enfermedad) que Medicina tomar el resultado de la prueva debe dar
% true.
%
 tomarMedicina(Perro,Medicina):- es_perroenfermo(Perro,Enfermedad),cura_enfer(Enfermedad,Medicina).


% ------------------------------------------------------------
% 1 Regla OR.
%
% La regla alg_tieneenfermedadc dice que PERR1(nombre del perro 1) y
% PERR2(nombre del perro 2) si comparten la misma enfermedad es decir
% PERRO1 tiene la misma enfermedad de PERRO2 si es asi el resultado de
% la prueva debe dar true.
alg_tieneenfermedad(PERR1,PERR2,ENF):-es_perroenfermo(PERR1,ENF);es_perroenfermo(PERR2,ENF).
%
%---------------------------------------------------------------
%
% 1 REGLA NOT
%
%asigna el perro al doctor.
% en este caso la regla confirmaelpacientealdoctor dice que monica tiene
% como doctora a drelena. se asigna que doctorveterinario tenga Perro
% y asi para los demas si esto es cierto el resultado de la prueva
% debe dar true.
%
%confirmaelpacientealdoctor(monica,drelena).
%confirmaelpacientealdoctor(andrey,drgonzalo).
%confirmaelpacientealdoctor(choco,candelaria).
%confirmaelpacientealdoctor(chuchita,drelena).
confirmaelpacientealdoctor(Doctor,Perro) :- perro(Perro),not(Perro=andrey),doctorveterinario(Doctor).

% 1 REGLA MIXTA
%
% la idea es que la regla compartensintoma diga que de es_perroenfermo
% compare si Perro1 y Perro2 tienen el mismo sintoma de la
% sintoma(Sintoma,Enfermedad)dado que
% es_perroenfermo(Perro1,EnfermedadA)como Perro 1 con su respectiva
% enfermedad EnfermedadA y es_perroenfermo(Perro2,EnfermedadB) lo
% mismo Perro2 con su respectiva enfermedad EnfermedadB si la
% EnfermedadA y EnfermedadB coencide, es cierto el resultado de la
% prueva debe dar true
%
compartensintoma(Perro1,Perro2,Sintoma):-
	es_perroenfermo(Perro1,EnfermedadA),es_perroenfermo(Perro2,EnfermedadB),not(Perro1= Perro2),
	sintoma(Sintoma,EnfermedadA),sintoma(Sintoma,EnfermedadB).
