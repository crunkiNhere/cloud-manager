from azure.identity import DefaultAzureCredential
from azure.mgmt.compute import ComputeManagementClient
from azure.mgmt.resource import ResourceManagementClient
from azure.mgmt.storage import StorageManagementClient

class AzureClient:
    def __init__(self, subscription_id: str):
        """Initialize Azure client with subscription ID."""
        self.credential = DefaultAzureCredential()
        self.subscription_id = subscription_id
        
        # Initialize clients
        self.compute_client = ComputeManagementClient(
            self.credential,
            self.subscription_id
        )
        self.resource_client = ResourceManagementClient(
            self.credential,
            self.subscription_id
        )
        self.storage_client = StorageManagementClient(
            self.credential,
            self.subscription_id
        )
    
    def list_virtual_machines(self, resource_group_name: str):
        """List all virtual machines in a resource group."""
        return self.compute_client.virtual_machines.list(resource_group_name)
    
    def create_resource_group(self, resource_group_name: str, location: str):
        """Create a new resource group."""
        return self.resource_client.resource_groups.create_or_update(
            resource_group_name,
            {"location": location}
        )
    
    def list_storage_accounts(self, resource_group_name: str):
        """List all storage accounts in a resource group."""
        return self.storage_client.storage_accounts.list_by_resource_group(resource_group_name) 