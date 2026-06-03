import snowflake.connector
import pandas as pd

from config.settings import *

conn = snowflake.connector.connect(
    account=SNOWFLAKE_ACCOUNT,
    user=SNOWFLAKE_USER,
    password=SNOWFLAKE_PASSWORD,
)

query = """
SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    ROW_COUNT
FROM INFORMATION_SCHEMA.TABLES
"""

df = pd.read_sql(query, conn)

df.to_excel(
    "reports/metadata_report.xlsx",
    index=False
)

print("Metadata report generated")