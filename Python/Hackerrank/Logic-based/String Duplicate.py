def count_substring(string, sub_string):
    ctr = 0
    duplicate = 0
    while(ctr<len(string)):
        index = string.find(sub_string,ctr)
        if(index!=-1):
            print("Found in ",index)
            ctr = index + 1
            duplicate = duplicate+1
        else:
            ctr = ctr+1
    return duplicate

if __name__ == '__main__':
    string = input("Enter string: ").strip()
    sub_string = input("How many is the: ").strip()
    count = count_substring(string, sub_string)
    print("No. of duplicates: ", count)