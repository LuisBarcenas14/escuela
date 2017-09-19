import Data.List ((\\))

nReinas n = reverse(aux n)
    where aux 0 = [[]]
          aux m = [r:rs | rs <- aux (m-1),
                          r <- ([1..n] \\ rs),
                          noAtaca r rs 1]

noAtaca _ [] _ = True
noAtaca r (a:rs) distH = abs(r-a) /= distH &&
                         noAtaca r rs (distH+1)
hanoi n a b c = imprimir n a b c

hanoi' 0 a b c= [""]
hanoi' n a b c= (hanoi'(n-1) a c b)++[".-mueve aro "++show n++" de "++a++" a "++c++"\n"]++(hanoi' (n-1) b a c)

inc n = n+1
imprimir n a b c  = imprimir' (length ((hanoi' n a b c))) ((hanoi' n a b c))

imprimir' m l = putNtimes 1 1 m l

putNtimes i j n l
  = if i == n 
       then putStr ("")
       else do putStr (show(j)++(l!!i))
               putNtimes (i+2) (j+1) n l

ciclo xs = [x | x<-xs]

--nReinas profe: revisar que en todas las columnas no se ataquen respecto a las diagonales

nReinasP n = nReinasP' [1..n]

nReinasP' [] = [[]]
nReinasP' l = [ reina:reinas | reina<-l, reinas<-nReinasP' (delete reina l), noAtacaP reina reinas 1]

delete e (x:xs) = if(e==x) then xs else x:(delete e xs)

noAtacaP _ [] _ = True
noAtacaP reina1 (reina2:reinas) dh =  (abs(reina1-reina2))/=dh && noAtacaP reina1 reinas (dh+1)

hanoi2 0 a b c= [""]
hanoi2 n a b c= (hanoi'(n-1) a c b)++[".-mueve aro "++show n++" de "++a++" a "++c++"\n"]++(hanoi' (n-1) b a c)

hanoi3 n a b c= zip [1..] [hanoi n a b c]

