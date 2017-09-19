f::Integer->Integer
f 0 =1
--f x=if(x==0) then 1 else x*f(x-1)
f x= x*f(x-1)

fib::Integer->Integer
fib 0 = 1
fib 1 = 1
fib x = fib(x-1)+fib(x-2)
