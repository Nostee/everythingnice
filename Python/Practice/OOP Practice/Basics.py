def add(x,y): #this is a function
    return(x+y)

class thisCode(): #this is a class, obviously
    def __init__(self,x,z): #this is the constructor
        #print("it works")
        self.num1 = x
        self.num2 = z

    def doThis(self): #this is a method
        print("Sample Only!")

    def doThis2(self):
        print(add(self.num1,self.num2)) #proceeds to a function

x = thisCode(5,4) #only runs the constructor
x.doThis2() #runs a specific method

class ey(thisCode): #inherits the methods o
    def __init__(self,x,y):
        super().__init__(x,y)
        self.name = x

    def doThis(self):
        print("{} is epal".format(self.name))

ran = ey(2,4)
ran.doThis2() #uses the method in thisCode() *the parent class
              #doThis2() is a method from thisCode()
ran.doThis() #uses the method originally in ey() #the child class

