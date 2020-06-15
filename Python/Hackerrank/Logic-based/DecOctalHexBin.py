def decimal(f):
    return f

def octaldeci(f):
    rem = []
    rem2 = ""
    dis = ""
    while (f != 0):
        rem.insert(0, str(f % 8))
        f = f // 8
    return(rem2.join(rem))

def hexadeci(f):
    rem = []
    rem2 = ""
    dis = ""
    while(f!=0):
        if(f%16<10):
            rem.insert(0,str(f%16))
        else:
            if(f%16==10):
                dis = "A"
            if(f%16==11):
                dis = "B"
            if(f%16==12):
                dis = "C"
            if(f%16==13):
                dis = "D"
            if(f%16==14):
                dis = "E"
            if(f%16==15):
                dis = "F"
            rem.insert(0,dis)
        f = f//16
    return(rem2.join(rem))


def binary(f):
    rem = []
    rem2 = ""
    while(f!=0):
        if(f%2==1):
            rem.insert(0,str(1))
        else:
            rem.insert(0,str(0))
        f = f//2
    return(rem2.join(rem))

def binary2(f):
    rem = []
    rem2 = ""
    while(f!=0):
        if(f%2==1):
            rem.insert(0,str(1))
        else:
            rem.insert(0,str(0))
        f = f//2
    return(len(rem2.join(rem)))

def print_formatted(number):
    for x in range(1,(number+1)):
        deci = decimal(x)
        octal = octaldeci(x)
        hexa = hexadeci(x)
        bina = int(binary(x))
        myList = []
        myList.append(str(deci))
        myList.append(str(octal))
        myList.append(str(hexa))
        myList.append(str(bina))
        print(myList[0].rjust(binary2(number)),myList[1].rjust(binary2(number)),myList[2].rjust(binary2(number)),myList[3].rjust(binary2(number)))

if __name__ == '__main__':
    n = int(input())
    print_formatted(n)