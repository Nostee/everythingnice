from itertools import combinations

# enter word
L = input()
# enter the number of characters you want
K = int(input())

C = list(combinations(L, K))
print(C)

# only puts the items with letter a on it in F
# how it works: item in C is sent to c.
#               then checks if 'a' is in c.
#               it returns true if it is found.
F = list(filter(lambda c: 'a' in c, C))
print(F)