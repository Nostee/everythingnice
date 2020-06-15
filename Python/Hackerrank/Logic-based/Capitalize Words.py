def solve(s):
    x = list(s.split(" "))  #converts the string to list
    myList = []
    for z in x:
        myList.append(z.capitalize())
    return(" ".join(myList))

s = input()
result = solve(s)
print(result)