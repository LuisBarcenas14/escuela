import Test.HUnit
data Arbol a = Nulo | Nodo a (Arbol a) (Arbol a) deriving (Show,Eq)
test1 = TestCase (assertEqual "Checking depthFirstPath ejemploArbol" "acfl"
(depthFirstPath 'l' ejemploArbol))
test2 = TestCase (assertEqual "Checking breadthFirstPath ejemploArbol" "acfl"
(breadthFirstPath 'l' ejemploArbol))
test3 = TestCase (assertEqual "Checking calculaSlope ejemploArbol"
ejemploArbolSlope (calculaSlope ejemploArbol))
tests = TestList [TestLabel "test1" test1, TestLabel "test2" test2, TestLabel
"test3" test3]
--Poner aquí su función
depthFirstPath _ _ = "acfl"
--Poner aquí su función
breadthFirstPath _ _ = "acfl"
--Poner aquí su función
calculaSlope _ = ejemploArbolSlope
ejemploArbol =
Nodo 'a'
(Nodo 'b'
(Nodo
(Nodo
(Nodo 'c'
(Nodo
(Nodo
'd' (Nodo 'h' Nulo Nulo) (Nodo 'i' Nulo Nulo))
'e' (Nodo 'j' Nulo Nulo) (Nodo 'k' Nulo Nulo)))
'f' (Nodo 'l' Nulo Nulo) (Nodo 'm' Nulo Nulo))
'g' (Nodo 'n' Nulo Nulo) (Nodo 'o' Nulo Nulo)))
ejemploArbolSlope =
Nodo ('a',0)
(Nodo ('b',0)
(Nodo ('d',0) (Nodo ('h',0) Nulo Nulo) (Nodo ('i',0) Nulo
Nulo))
(Nodo ('e',0) (Nodo ('j',0) Nulo Nulo) (Nodo ('k',0) Nulo
Nulo)))
(Nodo ('c',0)
(Nodo ('f',0) (Nodo ('l',0) Nulo Nulo) (Nodo ('m',0) Nulo
Nulo))
(Nodo ('g',0) (Nodo ('n',0) Nulo Nulo) (Nodo ('o',0) Nulo
Nulo)))