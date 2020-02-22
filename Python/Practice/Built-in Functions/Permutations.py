from itertools import permutations

string, n = input().split()

myPermu = sorted(list(permutations(string, int(n))))

print("No. of permu: ", len(myPermu))
for x in myPermu:
    for y in x:
        print(y, end="")
    print("")
print(len(myPermu))
