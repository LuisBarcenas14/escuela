{-
unionFind 10 [[1,2,3],[2,3,4],[1,2,5],[1,3,4],[2,6,7]]
-}

test = [[1,2,3],[2,3,4],[1,2,5],[1,3,4],[2,6,7]]

set1 = [0..9]

setp = [[1,4,3], [1,3,8], [1,6,5], [1,9,4], [1,2,1], [2,0,7],[2,8,9], [1,5,0], [1,7,2], [1,6,1], [1,1,0],[2,0,7]]

setc = [[1,1,3],[1,2,3],[1,2,5],[1,16,17], [1,18,19], [1,19,15], [1,15,18],[1,5,7], [2,5,6],[2,7,1],[2,1,5],[2,18,16],[2,2,13],[2,14,15],[2,19,19], [2,15,16], [2,16,18] ]
--res: [True,True,True,True,True,True,True,True,False,True,True,False,False,False,True,False,False]


list0=[0,1,2]

list01=[1,1,2]

list1=[1,4,3]

list2=[1,2,3,3,5,5]

findSet l a = if(l!!a==a) then a else findSet l (l!!a)

isSameSet l a b = if ((findSet l a)==(findSet l b)) then True else False

unionSet _ _ [] _ _ = []
unionSet i l (x:xs) a b=  if(i==l!!i && i==findSet l a) then (findSet l b):xs else x:(unionSet (i+1) l xs a b)

--grafo::Int->[[Int]]->[Bool]
grafo n l = unionFind' [0..(n-1)] l

unionFind' l [] =[]
--unionFind' l (y:ys) = if(y!!0==1) then True:(unionFind' (unionSet 0 l l (y!!1) (y!!2)) ys) else (isSameSet l (y!!1) (y!!2)):(unionFind' l ys)
unionFind' l ((y0:y1:y2:y):ys) = if(y0==1) then True:(unionFind' (unionSet 0 l l y1 y2) ys) else (isSameSet l y1 y2 ):(unionFind' l ys)

{-
grafo 10 [[1,4,3], [1,3,8], [1,6,5], [1,9,4], [1,2,1], [2,0,7],[2,8,9], [1,5,0], [1,7,2], [1,6,1], [1,1,0],[2,0,7]]

grafo 10 [[2,4,3], [1,4,3], [2,4,3], [2,9,4], [1,9,3], [2,9,4], [2,8,9], [1,8,9], [2,8,3]]

          C       C       C        X        C       C       C        X        C       C       C         
grafo 3 [[2,0,1],[2,0,2],[2,1,2], [1,1,0], [2,0,1],[2,0,2],[2,1,2], [1,1,2], [2,0,1],[2,0,2],[2,1,2]]

res: [F, F, F, T, T, F, F, T, T, T, T]
-}