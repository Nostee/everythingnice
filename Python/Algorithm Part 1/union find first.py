class UF:
    ctr = 0  # no. of items in the list
    myList = []

    def __init__(self, n):  # n should be the number of items in the list
        while(n > self.ctr):
            x, y = input().split()
            self.p = int(x)
            self.q = int(y)

            if self.connected(self.p, self.q) == True:
                pass
            else:
                self.union(self.p, self.q)

            if(self.p not in self.myList):
                self.myList.append(self.p)
            if(self.q not in self.myList):
                self.myList.append(self.q)

            self.ctr = len(self.myList)
            print(self.ctr)

    def connected(self, p, q):  # is it connected?
        return True

    def union(self):  # connect
        pass


if __name__ == "__main__":
    n = int(input())
    if n % 2 == 0:
        Dyn = UF(n)
