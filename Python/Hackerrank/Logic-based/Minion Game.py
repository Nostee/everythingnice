string = input()
length = len(string)
vowels = ["a","e","i","o","u"]

stuartScore = 0
kevinScore = 0

for x in range(length):
    if(string[x].casefold() in vowels): #KEVIN
        print("vowel detected!")
        kevinScore = kevinScore+(length-x)
    else:                               #STUART
        print("consonant detected")
        stuartScore = stuartScore+(length-x)

print("score of stuart: ",stuartScore)
print("score of kevin: ",kevinScore)