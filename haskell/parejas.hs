usuarios =["Juan","Pedro","Maria","Luis","Amelia","Ramiro"]

amigos = [[0,1],[2,0], [1,2], [3,4],[5,4]]

buscaIndice _ []_ = -1
buscaIndice n (x:xs) i = if(n==x) then i else buscaIndice n xs (i+1)

listaAmigos n = amigosC (buscaIndice n usuarios 0)

amigosC -1 = []
amigosC n = amigos' n  usuarios amigos

amigos' _ _ [] = []
amigos' n nomb (x:xs) =  if(x!!0==n) then nomb!!(x!!1):(amigos' n nomb xs) --Revisar primer nombre
else if (x!!1==n) then nomb!!(x!!0):(amigos' n nomb xs) --Revisar segundo nombre
else  amigos' n nomb xs --No encontro

conectados a b = if(buscaIndice b (listaAmigos a) 0 == -1) then False 
else True