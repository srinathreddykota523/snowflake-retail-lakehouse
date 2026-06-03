from azure.storage.blob import BlobServiceClient
from config.settings import *

connection_string = os.getenv(
    "AZURE_STORAGE_CONNECTION_STRING"
)

blob_service_client = BlobServiceClient.from_connection_string(
    connection_string
)

container_client = blob_service_client.get_container_client(
    AZURE_CONTAINER
)

for blob in container_client.list_blobs():
    print(blob.name)