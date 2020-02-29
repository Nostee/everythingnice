from itertools import product

x = map(int,input().split())
y = map(int,input().split())


z = list(product(x,y))

for x in z:
    print(x,end = " ")

