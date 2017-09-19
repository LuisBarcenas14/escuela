thrice::Int->Int
thrice n = 3*n
isPositive::Int->Bool
isPositive num = (num>0)
mystery::Int->Int->Int
mystery x y = (thrice x)+y

mayorDeDos::Int->Int->Int
mayorDeDos x y = if(x>y) then x else y

mayorDeTres::Int->Int->Int->Int
mayorDeTres x y z = mayorDeDos (mayorDeDos x y) z

mayorDeCuatro::Int->Int->Int->Int->Int
mayorDeCuatro a b c d = mayorDeDos (mayorDeTres a b c) d