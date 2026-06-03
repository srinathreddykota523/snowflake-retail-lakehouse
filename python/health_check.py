import pandas as pd

from config.settings import *

from utils.snowflake_connection import get_connection


conn = get_connection()

query = """
SHOW WAREHOUSES
"""

cur = conn.cursor()

cur.execute(query)

for row in cur:
    print(row)