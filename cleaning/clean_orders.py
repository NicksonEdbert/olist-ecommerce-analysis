import pandas as pd

def clean_orders_data(input_path, output_path):
    """
    Loads raw orders data, converts date columns to the correct
    datetime format, and saves the result as a Parquet file.
    """
    # Step 1: Load the data
    orders_df = pd.read_csv(input_path)

    # Step 2: Convert date columns to datetime objects
    # Fill the missing delivery dates with Nat(Not a time) instead of deleting the entire row to preserve data integrity
    orders_df['order_delivered_customer_date'] = pd.to_datetime(orders_df['order_delivered_customer_date'], errors='coerce')
    orders_df['order_delivered_carrier_date'] = pd.to_datetime(orders_df['order_delivered_carrier_date'], errors='coerce')
    orders_df['order_purchase_timestamp'] = pd.to_datetime(orders_df['order_purchase_timestamp'], errors='coerce')
    orders_df['order_approved_at'] = pd.to_datetime(orders_df['order_approved_at'], errors='coerce')
    orders_df['order_estimated_delivery_date'] = pd.to_datetime(orders_df['order_estimated_delivery_date'], errors='coerce')

    # Step 3: Save the cleaned data
    orders_df.to_parquet(output_path, index=False)

    print("Orders data cleaned and saved as Parquet successfully!")