from itertools import groupby

# if you want to get the number of duplicates of each character/number
# it is important to sort first the data because it only reads the similar items beside the item
for x , y in groupby(sorted(input())):
    # x is the element
    # y is the no. of duplicate but it is an iterable

    # displays the (element,no.of duplicate)
    print("({}, {})".format(len(list(y)),x),end = " ")