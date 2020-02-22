from collections import defaultdict

d = defaultdict(list)
d['python'].append("awesome")
d['something-else'].append("not relevant")
d['python'].append("language")

print((d.get("python","")))  #GETS ALL THE VALUE UNDER PYTHON
print((d.get("python",""))[1]) #GETS THE 2ND ELEMENT UNDER PYTHON

for i in d.items():
    print(i)

if("awesome" in d.get("python","")):
    print("THERE IT IS!")