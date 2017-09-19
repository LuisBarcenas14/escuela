concatenar [] [] = [] 
concatenar l [] = l 
concatenar [] l = l
concatenar (x:xs) (y:ys) = x:concatenar xs (y:ys)

myConcat [] = []
myConcat (x:xs) = concatenar x (myConcat xs)

listaFibonacci n = listaFibApoyo (n+1) 0 1 1

listaFibApoyo n i a b = if(i<n) then a:(listaFibApoyo n (i+1) b (a+b)) else []

concatN [] i = []
concatN (x:xs) i= if(i<length x) then ((x !! i):(concatN xs i)) else []

tieneN [] i = True
tieneN (x:xs) i= if(i+1<=length x) then (tieneN xs i) else False

separaListas [] = []
separaListas l =  separaListasApoyo l 0

separaListasApoyo l i= if((tieneN l i)==True) then (concatN l i):(separaListasApoyo l (i+1))  else []


--Apuntes del profesor

--myConcat2 [] = []
--myConcat2 (x:xs) = x++myConcat2 xs

--listaFibonacci2 x = take (x+1) fibs( 1 1)

--fibs ultimo penultimo= ultimo:fibs penultimo (ultimo+penultimo)


--for each [x+1 | x<-[2,4,6]]

--imprimePares y = 

masUno [] = []
masUno y = [x+1 | x<-y]

esPar [] = []
--esPar y = [ (if(x mod 2 == 0) then x else []) | x<-y]

separaListas2 l = [separaListas' l x | x<-[0 ..(minimo l)-1 ]]  where minimo l = minimum [length x| x<-l]
separaListas' l n = [(x!!n) | x<-l]

