import pandas as pd

from config.settings import *

from utils.snowflake_connection import get_connection

conn = get_connection()

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