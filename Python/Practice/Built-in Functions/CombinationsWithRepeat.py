from itertools import combinations_with_replacement

# x is word, y is number
x,y = input().split()

# combination but elements could repeat
for x in list(combinations_with_replacement(sorted(x),int(y))):
    print("".join(x))