import snowflake.connector
import pandas as pd

from config.settings import *

conn = snowflake.connector.connect(
    account=SNOWFLAKE_ACCOUNT,
    user=SNOWFLAKE_USER,
    password=SNOWFLAKE_PASSWORD,
    warehouse=SNOWFLAKE_WAREHOUSE,
    database=SNOWFLAKE_DATABASE,
)

query = """
SELECT
    COUNT(*) AS CUSTOMER_COUNT
FROM MART.DIM_CUSTOMERS
"""

df = pd.read_sql(query, conn)

print(df)