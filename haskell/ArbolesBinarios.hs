-- Definimos un nuevo tipo de datos. Un Arbol es Nulo o
-- un Nodo con un valor y dos subarboles (izquierdo y derecho)

data Arbol a = Nulo | Nodo a (Arbol a) (Arbol a) deriving (Show,Eq)

-- Crea una hoja del árbol
hoja x = Nodo x Nulo Nulo

-- cuatro árboles
t1 = hoja 10
t2 = Nodo 17 (Nodo 12 (Nodo 5 Nulo (hoja 8)) (hoja 15))
             (Nodo 115
                   (Nodo 32 (hoja 30) (Nodo 46 Nulo (hoja 57)))
                   (hoja 163))

t3 = Nodo 17 (Nodo 12 (Nodo 5 Nulo (hoja 8)) (hoja 18))
             (Nodo 115
                   (Nodo 32 (hoja 30) (Nodo 46 Nulo (hoja 57)))
                   (hoja 163))

t4 = Nodo 17 (Nodo 12 (Nodo 5 Nulo (hoja 8)) (hoja 15))
             (Nodo 115
                   (Nodo 32 (hoja 16) (Nodo 46 Nulo (hoja 57)))
                   (hoja 163))


-- Tamaño del árbol (cantidad de nodos)
size Nulo = 0
size (Nodo _ izq der) = 1 + size izq + size der

-- Convierte el arbol en una lista
arbolToList Nulo = []
arbolToList (Nodo x xi xd) = x : arbolToList xi ++ arbolToList xd

-- Convierte el árbol en una lista ordenada se asume que el árbol es un árbol de búsqueda
arbolToListOrd Nulo = []
arbolToListOrd (Nodo x xi xd) = arbolToListOrd xi ++ x : arbolToListOrd xd


-- Visually outputs a Arbol (sideways) by indenting each next Nodo and additional tab in, outputs 
-- the right side, then the Nodo, then the left side
pict t = putStr (pic "" t)
         where pic ind Nulo = ind ++ "."
               pic ind (Nodo x tl tr) = pic ('\t':ind) tr ++ "\n" ++
                                        ind ++ show x     ++ "\n" ++
                                        pic ('\t':ind) tl ++ "\n"



altura Nulo = -1
altura (Nodo _ hi hd) = 1 + max (altura hi) (altura hd)

tamanio Nulo = 0
tamanio (Nodo _ hi hd) = 1 + (tamanio hi) + (tamanio hd)

cuentaHojas Nulo = 0
cuentaHojas (Nodo _ Nulo Nulo) = 1
cuentaHojas (Nodo _ hi hd) = (cuentaHojas hi) + (cuentaHojas hd)

extremoIzq Nulo = error "no es posible"
extremoIzq (Nodo x Nulo _) = x
extremoIzq (Nodo _ hi _ ) = extremoIzq hi

mirror Nulo = Nulo
mirror (Nodo r hi hd) = Nodo r (mirror hd) (mirror hi)

inserta n Nulo = Nodo n Nulo Nulo
inserta n (Nodo r hi hd) | n<r = (Nodo r (inserta n hi) hd)
                         | n>r = (Nodo r hi (inserta n hd))
                         | otherwise = (Nodo r hi hd)

busqueda n Nulo = False
busqueda n (Nodo r hi hd) | r==n = True
                          | n<r =  (busqueda n (hi))
                          | otherwise = (busqueda n (hd))

camino n Nulo = error "no hay camino"
camino n (Nodo r hi hd) | n==r = [r]
                        | n<r = r:(camino n hi)
                        | n>r = r:(camino n hd)
                        |otherwise = error "no hay camino"


--camino2 n Nulo = 
camino2 n t = camino2' n t []

camino2' _ Nulo _ = []
camino2' n (Nodo r hi hd) c | n==r = c++[n]
                            | n<r = camino2' n hi (c++[r])  
                            | n>r = camino2' n hd (c++[r])

creaArbol 0 = Nulo
creaArbol n = ( Nodo n (creaArbol (quot n 2)) (creaArbol (quot n 2)) )

insertaLista [] t =  t
insertaLista (x:xs) t = insertaLista xs (inserta x t)

borra _ Nulo = Nulo
borra n (Nodo r hi hd) | (n>r) = Nodo r hi (borra n hd)
                       | (n<r) = Nodo r (borra n hi) hd
borra _ (Nodo _ Nulo hd)=hd
borra _ (Nodo _ hi hd) = Nodo z tz hd where (z,tz) = borraMax hi

borraMax (Nodo r hi Nulo) = (r,hi)
borraMax (Nodo r hi hd) = (z, Nodo r hi tz) where (z, tz)= borraMax hd



