# input the dividend,divisor
myTuple = divmod(int(input()),int(input()))
# outputs the quotient and the remainder
print(myTuple[0])
print(myTuple[1])
print(myTuple)

a = int(input())
b = int(input())
c = int(input())

print(pow(a,b)) # displays the regular power
print(pow(a,b,c)) # regular power then divides by 3. then displays the remainder