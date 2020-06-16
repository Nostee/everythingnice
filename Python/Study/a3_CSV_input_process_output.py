import pandas as pd

class mainFunc:
    def __init__(self):
        self.proc_loadCSV()
        self.proc_processCSV()
        self.proc_save_CSV()

    def proc_loadCSV(self):
        #loading a csv
        self.dataBin = pd.read_csv('CSV File.csv')

    def proc_processCSV(self):

        #show the csv
        print(self.dataBin)

        #show the csv first 20 entries
        print(self.dataBin.head(20))

        #Creating a new column (in this part, I just copied the first column)
        self.dataBin['new_column'] = self.dataBin['id']

        #How to delete a column
        self.dataBin = self.dataBin.drop(['id'], axis='columns')

        #How to select a specific column
        print(self.dataBin['new_column'])

        #Advanced: Multiply all input by 2 and put in in another column
        self.dataBin['multiplied'] = self.dataBin['new_column'].apply(lambda x: x*2)

    def proc_save_CSV(self):
        #saving to a new csv
        self.dataBin.to_csv('New CSV File.csv', index=False)


mainFunc()