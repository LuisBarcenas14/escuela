--Tores de Hanoi
hanoi 0 a b c= []
--hanoi 1 a b c= (1, a, b)
hanoi n a b c= (hanoi(n-1) a c b)++[(n,a,c)]++(hanoi (n-1) b a c)

permuta [] = [[]]
permuta l = [x:xs | x<-l, xs<-permuta (delete x l)]

delete _ [] = []
delete e (x:xs) = if(e==x) then xs else x:(delete e xs)


binario 0 = [""] 
--binarios n = binarios' (2^n-1) n 0

binario n = [x:xs | x<-['0','1'], xs<-binario (n-1) ]

combina l n | (n==1) = [[x]|x<-l]
			| ((length l)==n) = [l]
			| otherwise = [ (head l):xs | xs<-combina (tail l) (n-1) ]
			  ++combina (tail l) n

cPotencia [] = [""] 
--cPotencia l =  [x:xs |x<-(head l), xs<-cPotencia (tail l) ]++cPotencia (tail l)
cPotencia (x:xs) =[x:xs|xs<-cPotencia xs]++cPotencia xs

quicksort [] = []
quicksort (x:xs) = quicksort[ y|y<-xs,y<x]++[x]++quicksort[ y|y<-xs,y>=x]