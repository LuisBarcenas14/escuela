f1 n m = n+m
f2 n m = if m>n then m else n
f3 n = if n>100 then n else 0
f4 n = if n>'L' then n else 'A'
f45 n = if n=="AS" then n else "ASS"

f5 x = x+1
f6 x y = (x,y)
f7 x y = (pred x) + (succ y)
f8 x y z = x+y+z
f9 (x,y) = x+y
f10 x y = if(x=="si" && y=="si") then "no" else "si"


f11 x = x+1
f12 a b = if(a>(pred b +10)) then a else succ b

f13::Integer->Integer->Integer
f13 a b = a-b

f14 a = succ a
--f15 0 = 1
f15 a = a

f16 a b c = if(a=='C') then if(b==3) then True else False else False

f17 a b c d e = if(a=='C') then 0 else 1

