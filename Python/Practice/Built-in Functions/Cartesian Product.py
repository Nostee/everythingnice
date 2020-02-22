from itertools import product

x = map(int,input().split())
y = map(int,input().split())


z = list(product(x,y))
welp = len(list(z))
ctr = 0

for wew in z:
    print(wew,end = " ")

