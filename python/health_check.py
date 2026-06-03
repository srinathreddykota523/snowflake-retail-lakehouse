import snowflake.connector
import pandas as pd

from config.settings import *

conn = snowflake.connector.connect(
    account=SNOWFLAKE_ACCOUNT,
    user=SNOWFLAKE_USER,
    password=SNOWFLAKE_PASSWORD,
)

query = """
SHOW WAREHOUSES
"""

cur = conn.cursor()

cur.execute(query)

for row in cur:
    print(row)