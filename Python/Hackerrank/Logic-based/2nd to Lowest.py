myList = []
num = int(input("Enter number of students: "))
for x in range(num):
    myList.append([input("Enter name: "),float(input("Enter grades: "))])
    print("Current List: ",myList)

s2 = sorted(list(set([x[1] for x in myList])))[1]
[print("2nd to lowest: ",x) for x,s in myList if s==s2]

