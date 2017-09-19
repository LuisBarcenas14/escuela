mul n 0 = []
mul n m = mul' n m n 

mul' n 0 _ = []
mul' n m a= a:(mul' (n-1) (m-1) (a*(n-1)))