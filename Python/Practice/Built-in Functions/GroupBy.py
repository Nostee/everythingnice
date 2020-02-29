from itertools import groupby

for x , y in groupby(input()):
    print("({}, {})".format(len(list(y)),x),end = " ")