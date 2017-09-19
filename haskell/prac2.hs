fiboEficiente::Integer->Integer
fiboEficiente n = fib' n 0 0 1

fib'::Integer->Integer->Integer->Integer->Integer
fib' n c a b = if(n==c) then b else fib' n (c+1) b (a+b)

seno::Float->Integer->Float
seno s t = seno' s t 0 0 1 3

seno'::Float->Integer->Integer->Float->Float->Float->Float
seno' s t c r f cf =  if(c==t) then r
				   	  else seno' s t (c+1) (r + (-1)^c /f*s^(2*c+1) ) ( f*cf*(cf-1) ) (cf+2)