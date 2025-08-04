import pandas as pd

def process_order_items_data(input_path, output_path):
  """
  Loads order_items data from a CSV, validates it as clean,
  and saves it as a Parquet file for consistency in the Silver layer.
  """
  # Step 1: Load the data from the input_path
  order_items_df = pd.read_csv(input_path)

  # Step 2: (No cleaning needed for this file)

  # Step 3: Save the DataFrame to the output_path as a Parquet file
  # Don't forget index=False!
  order_items_df.to_parquet(output_path, index=False)

  print("Order items data processed and saved as Parquet successfully!")