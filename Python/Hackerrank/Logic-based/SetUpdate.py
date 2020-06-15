lel = int(input())
setA = set(map(int, input().split()))

for x in range(int(input())):
    command = input().split()
    command.insert(1, int(command[1]))
    command.pop()

    setB = set(map(int, input().split()))

    if (command[0] == "update"):
        setA.update(setB)
    if (command[0] == "intersection_update"):
        setA.intersection_update(setB)
    if (command[0] == "difference_update"):
        setA.difference_update(setB)
    if (command[0] == "symmetric_difference_update"):
        setA.symmetric_difference_update(setB)

print(sum(setA))


