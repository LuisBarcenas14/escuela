--succ n. regresa el sucesor de un número o letra.
--pred n. regresa el predecesor de n

sumaR::Integer->Integer->Integer
sumaR n 0 = n
--sumaR a b = sumaR (succ a) (pred b)
sumaR a b =  succ (sumaR a (pred b))

multR::Integer->Integer->Integer
multR n 0 = 0
multR n 1 = n
--sumaR a b = sumaR (succ a) (pred b)
--multR a b =  multR(sumaR a a) (pred b)
--multR n m = sumaR n (multR n (pred m) )
multR n m = sumaR n (multR n (pred m))

expR::Integer->Integer->Integer
expR n 0 = 1
--sumaR a b = sumaR (succ a) (pred b)
--multR a b =  multR(sumaR a a) (pred b)
expR n m = multR n (expR n (pred m) )

restaR::Integer->Integer->Integer
restaR n 0 = n
--sumaR a b = sumaR (succ a) (pred b)
--restaR a b =  pred (restaR a (pred b))
restaR n m= restaR (pred n) (pred m)

divR::Integer->Integer->Integer
divR n m = if(n>=m) then sumaR (1) (divR (restaR n m) m) else 0