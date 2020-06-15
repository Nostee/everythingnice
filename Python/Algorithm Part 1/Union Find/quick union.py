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
        if(self.root(p) == self.root(q)):
            return True
        return False

    def union(self, p, q):
        # know the root of 2nd number and connect it to the root of the 1st number
        # change the 1st number
        p = self.root(p)
        q = self.root(q)
        self.mainList[p] = self.mainList[q]
        print(self.mainList)

    def root(self, x):
        # chase until item is the same as index
        while(self.mainList[x] != x):
            x = self.mainList[x]
        return x


if __name__ == "__main__":
    uf = UF(int(input("Enter number of objects: ")))
