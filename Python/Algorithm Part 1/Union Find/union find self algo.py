class UF:
    objects = []
    mainList = []

    def __init__(self, n):
        while(len(self.objects) < n):
            p, q = input().split()
            self.p = int(p)
            self.q = int(q)
            if self.p not in self.objects:
                self.objects.append(self.p)
            if self.q not in self.objects:
                self.objects.append(self.q)

            if self.isConnected(self.p, self.q) == False:
                self.union(self.p, self.q)
            else:
                print("Connected.")

    def isConnected(self, p, q):
        for sublist in self.mainList:
            if p in sublist and q in sublist:
                return True
        return False

    def union(self, p, q):
        # if mainList is empty, instantly append
        if (len(self.mainList) != 0):
            # if mainList is not empty, pass through all the sublist in the list
            flag0 = 0
            for sublist in self.mainList:
                # find p in sublists
                if(p in sublist):
                    # if p is found in sublist, look for q in other sublist
                    flag0 = 1
                    flag1 = 0
                    for sublist2 in self.mainList:
                        if(q in sublist2):
                            # if q is found in sublist2, transfer all items in sublist2 to current sublist
                            for item in sublist2:
                                sublist.append(item)
                                print(self.mainList)
                            self.mainList.remove(sublist2)
                            print(self.mainList)
                            flag1 = 1
                    # if q isn't found in other sublist, append q in the current sublist
                    if flag1 == 0:
                        sublist.append(q)
                        print(self.mainList)
                elif(q in sublist):
                    # if q is found in sublist, look for p in other sublist
                    flag0 = 1
                    flag1 = 0
                    for sublist2 in self.mainList:
                        if(p in sublist2):
                            # if p is found in sublist2, transfer all items in sublist2 to current sublist
                            for item in sublist2:
                                sublist.append(item)
                                print(self.mainList)
                            self.mainList.remove(sublist2)
                            print(self.mainList)
                            flag1 = 1
                    # if p isn't found in other sublist, append p in the current sublist
                    if flag1 == 0:
                        sublist.append(p)
                        print(self.mainList)
            # if p or q isn't found in all sublists, append a new sublist.
            if(flag0 == 0):
                self.mainList.append([p, q])
                print(self.mainList)
        else:
            self.mainList.append([p, q])
            print(self.mainList)


if __name__ == "__main__":
    uf = UF(int(input()))  # input number of times
