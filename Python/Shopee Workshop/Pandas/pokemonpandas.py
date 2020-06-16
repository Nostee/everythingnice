import pandas as pd

#pd.set_option('display.max_rows', None)
#pd.set_option('display.max_columns', None)
#pd.set_option('display.width', None)

pokemon_df = pd.read_csv("Pokemon_Gen_1-8.csv")
# if same folder location as the py file, just write the file name of csv

# creating dataframe with selected columns only
pokemon_generation = pokemon_df.loc[20:28, ["#", "Name", "Generation"]]
# index, data. if you want to select all indexes, leave it as :

# reading a single value
pokemon_12 = pokemon_df.loc[12, :]

# print(pokemon_generation)
print(pokemon_12)
