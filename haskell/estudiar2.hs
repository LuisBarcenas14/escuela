{-
Height-balanced trees or AVL trees are binary search trees in which 
the heights of the left and right subtrees differ by at most one.

Let us assume that we have written a function 'rebalance' that
reestablishes the height-balanced property after an insert or
delete.

Here is how we would write functions for inserting and deletting
nodes in a tree:

-}
data Arbol a = Nulo | Nodo a (Arbol a) (Arbol a) deriving (Show,Eq)

insertTree n Nulo = Nodo n Nulo Nulo
insertTree n (Nodo r i d) 
   | (n > r) = rebalance (Nodo r i (insertTree n d))
   | (n < r) = rebalance (Nodo r (insertTree n i) d)
   | otherwise = Nodo r i d
   
deleteTree Nulo _ = Nulo
deleteTree (Nodo y tleft tright) x
    | x < y   = rebalance (Nodo y (deleteTree tleft x)  tright)
    | x > y   = rebalance (Nodo y tleft  (deleteTree tright x))

-- In all cases below, we must have x == y

deleteTree (Nodo _ Nulo  tright) _   = tright
deleteTree (Nodo y tleft  tright) x = rebalance (Nodo z tz  tright)
    where (z,tz) = deletemax tleft   

deletemax (Nodo y t1  Nulo) = (y,t1)
deletemax (Nodo y t1  t2) = (z, Nodo y t1 tz)
    where (z,tz) = deletemax t2


{-

Let us define the slope of a node to be the difference in heights
between the left and right subtrees of the node.  In a
height-balanced tree, the slope of each node is in the range
(-1,0,+1).  Inserting or deleting a node can at most change the
slope by 1.  In the modified functions inserttree and deletetree,
we apply rebalancing bottom up, starting from the lowest node
where we potentially disrupt the balance.  Thus, when we need
to rebalance a node, we can assume that its slope is either 2 or
-2 and its subtrees are inductively height-balanced.

Suppose a node has slope 2 (the case -2 will be symmetric) with
both its subtrees height-balanced.  Then, the height of the left
subtree is two more than that of the right subtree.  We shall
consider two cases.

a) The slope at the root of the left subtree is 0 or 1.

   This situation corresponds to the following picture, where t[h]
   denotes that t has height h

                        x
                       / \
                      y   t3[h]
                    /   \
                t1[h+1]  t2[h or h+1]

   We can rotate this tree to the right as follows


                        y
                      /   \
                t1[h+1]    x
                         /   \
               t2[h or h+1]  t3[h]

   It is easy to observe that the slope at y is 0 or -1 and the
   slope at x is either 1 or 0, so the rotated tree is
   height-balanced (recall that t1, t2 and t3 were inductively
   assumed to be height-balanced).
   
b) The slope at the root of the left subtree is -1.

   This situation corresponds to the following picture, where t[h]
   denotes that t has height h

                        x
                       / \
                      y   t3[h]
                    /   \
                t1[h]  t2[h+1]

   where t2 looks like

                        z
                      /   \
         t21[h or h-1]     t22[h or h-1]

   with at least one of t21 or t22 being of height h.

   We can now rotate the subtree rooted at y to the left, as
   follows.

                        x
                      /   \
                    z      t3[h]
                  /   \
                y      t22[h or h-1]
               / \
          t1[h]   t21[h or h-1]

   Notice that at this stage, the slope at z may be 2 (because it
   is possible that t1[h], t21[h] and t22[h-1]).

   However, we now apply a right rotation at x to get

                 _____________z____________
                /                          \
              y                              x
             / \                            / \
        t1[h]   t21[h or h-1]  t22[h or h-1]   t3[h]

   At this point, clearly the slope of x is -1 or 0, the slope of
   y is 1 or 0 and the slope of z is 0.  

We can now write the function rebalance:

-}

rebalance (Nodo y t1  t2)
     | abs (sy) < 2         = Nodo y t1  t2
     | sy == 2 && st1 /= -1 = rotateright (Nodo y t1  t2)
     | sy == 2 && st1 == -1 = rotateright (Nodo y (rotateleft t1)  t2)
     | sy == -2 && st2 /= 1 = rotateleft (Nodo y t1 t2)
     | sy == -2 && st2 == 1 = rotateleft (Nodo y t1 (rotateright t2))
     | otherwise = error "Something Wrong"
     where
       sy  = slope (Nodo y t1  t2)
       st1 = slope t1
       st2 = slope t2
       rotateright (Nodo x (Nodo y t1  t2)  t3) = Nodo y t1  (Nodo x t2 t3)
       rotateleft  (Nodo x t1  (Nodo y t2  t3)) = Nodo y (Nodo x t1  t2)  t3

slope Nulo = 0
slope (Nodo x t1 t2) = (height t1) - (height t2)


height Nulo = 0
height (Nodo x t1  t2) = 1 + (max (height t1) (height t2))

-- Auxuliary functions:
-- Visually outputs a Arbol (sideways) by indenting each next Nodo and additional tab in, outputs 
-- the right side, then the Nodo, then the left side
pict t = putStr (pic "" t)
         where pic ind Nulo = ind ++ "."
               pic ind (Nodo x tl tr) = pic ('\t':ind) tr ++ "\n" ++
                                        ind ++ show x     ++ "\n" ++
                                        pic ('\t':ind) tl ++ "\n"


--Inserts a list of elements into an AVL trees
insertList [] t = t
insertList (x:xs) t = insertList xs (insertTree x t)

isBalanced Nulo = True
isBalanced t@(Nodo r i d) = (abs (slope t) < 2) && (isBalanced i) && (isBalanced d)  

nivel n [] = []
nivelNodo 0 (Nodo r hi hd) = [r]
nivelNodo n (Nodo r hi hd) = nivelNodo (n-1) hi ++ nivelNodo (n-1) hd

-- let arbol = insertList['a'..'g'] Nulo


depthfirst Nulo = [] 
depthfirst (Nodo r hi hd) = r:(depthfirst(hi)++depthfirst(hd))

breathFirst arbol = bfs [arbol]

bfs [] = []
bfs (Nulo:xs) = bfs xs
bfs ((Nodo r hi hd):xs)= r:(bfs (xs++[hi,hd])) 

--SWI prolog
t1= 
	Nodo 10 (Nodo 5 (Nodo 1 Nulo
	Nulo) (Nodo 7 Nulo Nulo)) (Nodo
	15 (Nodo 12 Nulo Nulo) Nulo)

t2= 
  Nodo 17 (Nodo 12 (Nodo 5 Nulo (Nodo 8 Nulo Nulo)) (Nodo 15 Nulo Nulo)) (Nodo 115
  (Nodo 32 (Nodo 30 Nulo Nulo) (Nodo 46 Nulo (Nodo 57 Nulo Nulo))) (Nodo 163 Nulo
  Nulo))


primerElemento l = [x++['z'] | x<-l]
{-
--Exámen prueba
raiz Nulo = []
raiz (Nodo x _ _) = [x]
misterio1 nodo Nulo = []
misterio1 nodo (Nodo y hi hd) | (nodo == y) = (raiz hi) ++ (raiz hd)
							  | (nodo > y) = misterio1 nodo hd
							  | otherwise = misterio1 nodo hi

sumaHojas Nulo = 0
sumaHojas (Nodo r Nulo Nulo) = 1
sumaHojas (Nodo _ hi hd) = (sumaHojas hi) + (sumaHojas hd)


misterio2 l [] = []
misterio2 [] l = []
misterio2 (x:xs) (y:ys) = if (x<y) then x: misterio2 xs (y:ys) else y:misterio2(x:xs) ys
-}

--Exámen prueba2
test0 (x:x1:x2)= x
test1 (x:x1:x2)= x1
test2 (x:x1:x2)= x2

misterio1 [] =True
misterio1 [_] =False
misterio1 (_:_:xs)= misterio1 xs 

misterio2 l = zipWith (+) l (tail l)

misterio3 Nulo _ = []
misterio3 (Nodo r hi hd) n = 
    if(r>=n) then [r]++misterio3 hi (n+1)++misterio3 hd (n+1)
    else misterio3 hi (n+1) ++ misterio3 hd (n+1)

llenaArbol n | n>100 = Nulo
             | otherwise = Nodo n (llenaArbol (n*2)) (llenaArbol (n*2)) 