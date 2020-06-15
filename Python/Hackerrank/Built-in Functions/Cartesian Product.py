from itertools import product

# enters multple numbers seperated by space
# map is for converting every inputted strings to int
# map is iterable. should be converted into list first if you want to display it right away
x = map(int,input().split())
y = map(int,input().split())

#makes a cartesian product from x and y and converts it into a list
z = list(product(x,y))

#puts every item in z into x then prints it in a one line(seperated with a space) using <end = " ">
for x in z:
    print(x,end = " ")

