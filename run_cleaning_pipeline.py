from cleaning.clean_products import clean_products_data

if __name__ == '__main__':
    # Define paths for clarity
    raw_products_path = 'data/raw/products.csv'
    clean_products_path = 'data/processed/products_clean.parquet'

    print("Starting the cleaning pipeline...")

    # Step 1: Clean products
    clean_products_data(raw_products_path, clean_products_path)

    # Step 2: Clean orders (coming soon)
    # clean_orders_data(...)

    # Step 3: Clean customers (coming soon)
    # clean_customers_data(...)

    print("Entire pipeline finished!")