import pandas as pd

raw_data_path = "data/raw/online_retail.csv"
transformed_data_path = 'data/processed/online_retail_processed.csv'

def transform_raw_data(raw_data_path, transformed_data_path):
    # Read the raw data
    df = pd.read_csv(raw_data_path, delimiter=';', header=0)
    # Remove rows with negative quantities, missing invoice numbers, or missing customer IDs
    df.drop(df[(df["Quantity"] < 0) | (df["Invoice"].isnull()) | (df["Customer ID"].isnull())].index, inplace=True)
    # Save the transformed data
    df.to_csv(transformed_data_path, index=False)
    print("Data transformation complete. Transformed data saved to:", transformed_data_path)

transform_raw_data(raw_data_path, transformed_data_path)