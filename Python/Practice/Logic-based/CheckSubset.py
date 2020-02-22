for x in range(int(input())):
    setAlen = int(input())
    setA = set(map(int,input().split()))
    setBlen = int(input())
    setB = set(map(int,input().split()))

    new = setA.intersection(setB)
    if(new==setA):
        print("True")
    else:
        print("False")


