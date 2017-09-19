soloPositivos [] = []
soloPositivos (x:xs) = if(x>0) then x:soloPositivos xs else soloPositivos xs

elimina [] n = []
elimina (x:xs) n = if(x/=n) then x:elimina xs n else elimina xs n

mezcla [] [] = []
mezcla l [] =l
mezcla [] l = l
mezcla (x:xs) (y:ys) = if(x<=y) then x:mezcla xs (y:ys) else y:mezcla (x:xs) ys

estaEn [] n = False
estaEn (x:xs) n = if(x==n) then True else estaEn xs n 

interseccion [] [] = []
interseccion l [] = []
interseccion [] l = []
interseccion (x:xs) (y:ys) = if(estaEn (y:ys) x ) then x:interseccion xs (y:ys) else interseccion xs (y:ys)
--interseccion (x:xs) (y:ys) = if (x==y) then x:interseccion xs ys else interseccion (x:xs) ys

union [] [] = []
union l [] = l
union [] l = l
union (x:xs) y = x:union xs y