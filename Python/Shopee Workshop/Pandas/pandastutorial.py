import numpy as np
import pandas as pd

if __name__ == "__main__":

    # Creating Data Frame using Pandas
    cars = {"Brand": ["Honda", "Toyoya", "Ford"],
            "Price": [22000, 25000, 27000]}
    cars_df = pd.DataFrame(cars, columns=["Brand", "Price"], index=[
        "Car 1", "Car 2", "Car 3"])
    # Renaming the index is optional

    # Adding column
    year = [2010, 2011, 2008]
    cars_df["Year"] = year

    # Adding column using insert
    cars_df.insert(1, "Model", ["Civic", "Prius", "Focus"], True)
    # index, name of column, data, true if it can be duplicated, leave it blank if it should be unique

    # Adding additional row
    # new_car_1 = {"Brand": "Hyundai", "Model": "Avante",
    #cars_df = cars_df.append(new_car_1, ignore_index=True)
    # reverts the index name to default

    # Adding row using loc
    cars_df.loc["Car 4"] = ["Hyundai", "Avante", 20000, 2010]

    # Updating data using loc
    cars_df.loc["Car 3"] = ["Suzuki", "Swift", 26000, 2013]

    # Adding column with manipulated data
    cars_df["Discount"] = 0.1*cars_df["Price"]
    cars_df["Discounted Price"] = cars_df["Price"]-cars_df["Discount"]

    print(cars_df)
