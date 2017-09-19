import math

n = input()
mod = 1000000007
ans = (math.factorial(2*n)) / (math.factorial(n)*math.factorial(n)*(n+1))
ans = ans % mod
print ans