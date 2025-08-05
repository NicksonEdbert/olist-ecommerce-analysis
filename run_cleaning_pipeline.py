from cleaning.clean_products import clean_products_data
from cleaning.clean_order_items import process_order_items_data

if __name__ == '__main__':
    # Define paths for clarity
    raw_products_path = 'data/raw/products.csv'
    clean_products_path = 'data/processed/products_clean.parquet'
    raw_order_items_path = 'data/raw/order_items.csv'
    clean_order_items_path = 'data/processed/order_items_clean.parquet'

    print("Starting the cleaning pipeline...")

    # Step 1: Clean products
    clean_products_data(raw_products_path, clean_products_path)

    # Step 2: Clean orders (coming soon)
    process_order_items_data(raw_order_items_path, clean_order_items_path)

    # Step 3: Clean customers (coming soon)
    # clean_customers_data(...)

    print("Entire pipeline finished!")