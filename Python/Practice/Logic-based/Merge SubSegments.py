string = input()
length = int(input())
myList = []
mainList = []
ctr = 0
try:
    for x in string:
        ctr = ctr+1
        myList.append(x)
        if(ctr==length):
            mainList.append(myList)
            myList = []
            ctr = 0
    for x in range(len(mainList)):
        print("".join(list(dict.fromkeys(mainList[x]))))
except:
    nothing = 0