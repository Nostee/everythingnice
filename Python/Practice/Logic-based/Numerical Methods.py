from prettytable import PrettyTable

def substitute(toggle,x):
    if (toggle == 1):
        ans = 2.71828 ** -x
        return round(ans,4)
    if (toggle == 2):
        ans = -1/(x**2)-3
        return round(ans,4)
    if (toggle == 3):
        ans = 20/((x**2)+(2*x)+10)
        return round(ans,4)

def check(val1,val2):
    ans =  (val1-val2)/(val1)
    return abs(round(ans,4))

def trial():
    toggle = int(input("Enter problem no: "))
    iniVal = float(input("Enter inital value: "))
    if (toggle == 1):
        print("Equation: 2.71828 ** -x")
    if (toggle == 2):
        print("Equation: -1/(x**2)-3")
    if (toggle == 3):
        print("Equation: 20/((x**2)+(2*x)+10)")

    t = PrettyTable(['K', 'X^K', 'X^K+1', 'd^K'])
    k = 0
    loop = True
    while (loop == True):
        xk1 = substitute(toggle, iniVal)
        dk = check(xk1, iniVal)
        t.add_row([k, iniVal, xk1, dk])
        if (dk <= 0.001):
            loop = False
        k = k + 1
        iniVal = xk1
    print(t)
    tryAgain = input("Choose another problem? Y/N: ")
    if tryAgain == "Y" or tryAgain == "y":
        trial()
    else:
        pass

trial()











