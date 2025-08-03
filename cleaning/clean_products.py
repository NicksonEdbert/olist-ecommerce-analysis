import pandas as pd

def clean_products_data(input_path, output_path):
  """
  Loads product data from a CSV, cleans it,
  and saves the result to a Parquet file.

  Args:
    input_path (str): The file path for the raw data CSV.
    output_path (str): The file path to save the cleaned data as a Parquet file.
  """
  # Step 1: Load the data from the input_path
  products_df = pd.read_csv(input_path)

  # Step 2: Apply the cleaning logic (drop rows with null category names)
  products_df_cleaned = products_df.dropna(subset=['product_category_name'])

  # Step 3: Save the cleaned DataFrame to the output_path using to_parquet()
  # Make sure not to save the pandas index column!
  products_df_cleaned.to_parquet(output_path, index=False)

  print("Products data cleaned and saved as Parquet successfully!")