mayorDeDos a b = if(a==b+1) then a else b

igual a b = if(a==b) then "yes" else "no"

f1 x y = (pred x) + (succ y)

f2 n m = if m == (n*2) then m else n

f3 n m = if (m==True) then 'm' else 'n'

--f1::(Num a, Enum a)=>a->a->a
--f2::(Ord, Num)=>a->a->a