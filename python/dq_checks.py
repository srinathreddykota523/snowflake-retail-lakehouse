from utils.snowflake_connection import get_connection
import pandas as pd

conn = get_connection()

query = """
SELECT COUNT(*) AS CUSTOMER_COUNT
FROM DIM_CUSTOMERS_RECOVERED
"""

df = pd.read_sql(query, conn)

print(df)