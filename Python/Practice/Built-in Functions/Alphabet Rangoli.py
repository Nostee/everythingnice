import string
alpha = string.ascii_lowercase

def print_rangoli(n):
    width = ((n * 2 - 1) * 2) - 1
    # print("width is ",width)
    myList = []
    for x in range(n):
        x = "-".join(alpha[x:n])
        myList.append(x[::-1] + x[1:])

    # print(myList)

    for y in range(n - 1, -1, -1):
        try:
            print(myList[y].center(width, "-"))
        except:
            z = 1

    for z in range(1, n):
        try:
            print(myList[z].center(width, "-"))
        except:
            w = 1

if __name__ == '__main__':
    n = int(input())
    print_rangoli(n)