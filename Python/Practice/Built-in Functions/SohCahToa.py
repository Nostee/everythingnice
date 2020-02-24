import math

#length of AB (adjacent)
len1 = int(input())
#length of BC (opposite)
len2 = int(input())


print(str(int(round(math.degrees(math.atan2(len1,len2)))))+"°")

#atan(inverse of tan)
#asin(inverse of sin)
#acos(inverse of cos)
#just add 2 after the function to receive 2 values just like the example.