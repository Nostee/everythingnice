myList = []
for x in range(int(input("Enter number of students: "))):
    mark = input().split()
    ave = (float(mark[1])+float(mark[2])+float(mark[3]))/3
    myList.append([mark[0],ave])
name = input("Enter name of student: ")
[print("Average is %.2f"%b) for a,b in myList if a==name]
