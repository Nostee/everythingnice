from itertools import combinations

word = input().split()

for x in range(1,int(word[1])+1):
    myList = sorted((combinations(sorted(word[0]),x)))
    for y in myList:
        print("".join(y))

