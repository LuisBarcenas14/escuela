grafo n l = graph' [0..(n-1)] l []

graph' _ [] s = s
graph' node ([1,v1,v2]:xs) s = graph' (overwrite (node!!v1) (node!!v2) node) xs (s++[True])
graph' node ([2,v1,v2]:xs) s = graph' node xs (s++[(node!!v1==node!!v2)])