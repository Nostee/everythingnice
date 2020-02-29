from itertools import combinations

word = input().split()

for x in range(1,int(word[1])+1):
    myList = sorted((combinations(sorted(word[0]),x)))
    for y in myList:
        print("".join(y))

#another example
N = int(input())
L = input().split()
K = int(input())

C = list(combinations(L, K))
F = filter(lambda c: 'a' in c, C)
print("{0:.3}".format(len(list(F))/len(C)))