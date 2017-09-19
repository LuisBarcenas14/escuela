--c
concatena [] [] = []
concatena l [] = l
concatena [] l = l
concatena (x:xs) y = x:concatena xs y

rota 0 l = l
rota n (x:xs) = rota (n-1) (concatena xs [x])--(x:[]))

creaLista 0 = []
creaLista n = n:creaLista (n-1)