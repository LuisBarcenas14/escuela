--sumaLista
--longitud de lista
-- mayorDeLista
estaEn e [] = False
estaEn e (x:xs) = if (e==x) then True else (estaEn e xs)

longitud [] = 0
longitud (x:xs) = 1+(longitud xs)

donde e [] i = -1
donde e (x:xs) i = if (e==x) then i else (donde e xs i+1)

todosPositivos [] =True
todosPositivos (x:xs) = if (x<=0) then False else (todosPositivos xs)

eliminarElemento e [] = []
eliminarElemento e (x:xs) = if(e==x) then xs else x:(eliminarElemento e xs)

eliminarElemento2 e [] = []
eliminarElemento2 e (x:xs) = if(e==x) then eliminarElemento2 e xs else x:(eliminarElemento e xs)

ordenada [] =True
ordenada [_] = True
ordenada (x:xs)= if(x<head xs) then ordenada xs else False

ordenada2 (x (y:ys)) = if x>=y then False else (ordenada y:ys)


-- (:) se usa para unir listas
--(++) se usa para concatener cadenas