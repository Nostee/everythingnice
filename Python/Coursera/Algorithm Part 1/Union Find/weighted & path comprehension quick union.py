class UF:

    mainList = []
    numList = []
    ctr = 0

    def __init__(self, n):
        for x in range(0, n):
            self.mainList.append(x)
        for x in range(0, n):
            self.numList.append(0)

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
        if(self.root(p) == self.root(q)):
            return True
        return False

    def union(self, p, q):
        # know the root of 2nd number and connect it to the root of the 1st number
        p = self.root(p)
        q = self.root(q)

        # weighting
        if(self.numList[p] > self.numList[q]):  # if p has more roots
            self.mainList[q] = self.mainList[p]
            q = self.mainList[q]
            self.numList[q] += 1
        elif(self.numList[q] > self.numList[p]):  # if q has more roots
            self.mainList[p] = self.mainList[q]
            p = self.mainList[p]
            self.numList[p] += 1
        else:
            self.mainList[q] = self.mainList[p]
            q = self.mainList[q]
            self.numList[q] += 1
        print("Current # of objects to each index: {}".format(self.numList))
        print("Current list: {}".format(self.mainList))

    def root(self, x):
        # chase until item is the same as index
        # path comprehension
        while(self.mainList[x] != x):
            self.mainList[x] = self.mainList[self.mainList[x]]
            x = self.mainList[x]
        return x


if __name__ == "__main__":
    uf = UF(int(input("Enter number of objects: ")))
