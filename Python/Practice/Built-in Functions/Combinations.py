from itertools import combinations

# goal is to print every combination from 1 to n
# inputs a word and a number seperated with space
word = input().split()

# range is from 1 to the n
for x in range(1,int(word[1])+1):
    myList = sorted((combinations(sorted(word[0]),x)))
    print(myList)
    for y in myList:
        print("".join(y))


