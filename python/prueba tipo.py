def cube(n):
    return n**3

def by_three(n):
    if n%3==0:
        return cube(n)
    else:
        return False
        
n1 = by_three(9)
print n1
n2 = by_three(2)
print n2