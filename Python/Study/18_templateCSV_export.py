import pandas as pd

#Dummy Code
# Goal is magcreate ng ganto
#
#  id  new_number
#  0       2
#  1       3
#  2       4
#  3       5
#  4       6
#
# Gumawa ako ng databin. (DataFrame is special array of panda)
# Two arrarys, (ginawa ko to dun sa proc_Dummy Logic).
# Then nilagay ko yung dalawang array sa databin
#
# Tapos inexport ko yung databin sa proc_CSV_Export


# Pwede ireuse tong code na to. Palitan nyo lang yung laman ng proc_DummyLogic

class mainFunc:
    def __init__(self):
        self.proc_DummyLogic()
        self.proc_CSV_Export()

    def proc_DummyLogic(self):
        x1 = list()
        x2 = list()

        self.dataBin = pd.DataFrame()

        for i in range(0,101):
            x1.append(i)
            x2.append(i+2)

        self.dataBin['id'] = x1
        self.dataBin['new_number'] = x2

        print(self.dataBin)

    def proc_CSV_Export(self):
        self.dataBin.to_csv('CSV file.csv', index=False)

mainFunc()