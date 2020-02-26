from itertools import combinations_with_replacement
x,y = input().split()

for x in list(combinations_with_replacement(sorted(x),int(y))):
    print("".join(x))