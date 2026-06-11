# Solution Architecture

Azure Blob Storage
        |
        v
Snowpipe
        |
        v
RAW Layer
        |
        +-------------------+
        |                   |
        v                   v
Streams & Tasks     Dynamic Tables
        |                   |
        +---------+---------+
                  |
                  v
          TRANSFORM Layer
                  |
                  v
             dbt Models
                  |
                  v
             MART Layer
                  |
                  v
              Power BI