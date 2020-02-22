from collections import Counter

myList = [1,1,2,3,4,5,3,2,3,4,2,1,2,3]

print(Counter(myList).items())
print(Counter(myList).keys()) #keys are groups
print(Counter(myList).values()) #keys are the elements of the groups

print(Counter(myList).get(2,"")) #gets the value under 2
