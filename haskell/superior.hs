func n = map (+1) n
--let sobreescrie¿be una palabra
--zip empareja con el otro
--zipwith regresa una lista de valores dadas dos listas aplicandoles una función.

fibs = 1:1:(zipWith (+) fibs (tail fibs))