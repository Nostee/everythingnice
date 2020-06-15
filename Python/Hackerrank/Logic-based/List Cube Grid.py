x = int(input("Enter x: "))
y = int(input("Enter y: "))
z = int(input("Enter z: "))
n = int(input("Enter n: "))

myList = []

ctr1 = 0
ctr2 = 0
ctr3 = 0

while(ctr1<=x):
    while(ctr2<=y):
        while(ctr3<=z):
            if((ctr1+ctr2+ctr3)!=n):
                myList.append([ctr1, ctr2, ctr3])
            ctr3 = ctr3 + 1
        ctr2 = ctr2+1
        ctr3 = 0
    ctr1 = ctr1+1
    ctr2 = 0
    ctr3 = 0

print(myList)



