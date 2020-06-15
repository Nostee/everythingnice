class UF:

    mainList = []
    ctr = 0

    def __init__(self, n):
        for x in range(0, n):
            self.mainList.append(x)
        # ask how many operations
        op = int(input("How many operations do you want? "))
        while(op > self.ctr):
            p, q = input().split()
            p = int(p)
            q = int(q)
            self.ctr += 1
            if(self.connected(p, q) == True):
                print("It is connected")
            else:
                self.union(p, q)

    def connected(self, p, q):
        if(self.mainList[p] == self.mainList[q]):
            return True
        return False

    def union(self, p, q):
        # go to the array of p then get item
        item1 = self.mainList[p]
        # get the item of q
        item2 = self.mainList[q]
        for x in range(0, len(self.mainList)):
            # pass through all the item in the list then check if it's equal to item2.
            # if it's equal to item 2, change it to item 1
            if(self.mainList[x] == item2):
                self.mainList[x] = item1
        print(self.mainList)


if __name__ == "__main__":
    uf = UF(int(input("Enter number of objects: ")))
