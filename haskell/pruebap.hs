amigos n [] = []
amigos n (x:xs) = if(x!!0==n) then (x!!0):amigos n xs else amigos n xs 
--amigos n xs = amigos n xs

dos [] =  []
dos (x:xs) =  [x!!0, x!!1]:dos xs

uno l = l!!0
