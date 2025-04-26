from abc import ABC, abstractmethod

class CloudProvider(ABC):
    """Abstract base class for cloud providers."""
    
    @abstractmethod
    def list_virtual_machines(self, resource_group: str):
        """List all virtual machines in a resource group."""
        pass
    
    @abstractmethod
    def create_resource_group(self, name: str, location: str):
        """Create a new resource group."""
        pass
    
    @abstractmethod
    def list_storage_accounts(self, resource_group: str):
        """List all storage accounts in a resource group."""
        pass 