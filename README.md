# Cloud Manager

A cloud-agnostic service for managing cloud resources across multiple providers (Azure, AWS, GCP).

## Setup

1. Create a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Configure environment variables:
Create a `.env` file with your cloud provider credentials:
```env
# Azure
AZURE_SUBSCRIPTION_ID=your_subscription_id
AZURE_TENANT_ID=your_tenant_id
AZURE_CLIENT_ID=your_client_id
AZURE_CLIENT_SECRET=your_client_secret

# AWS
AWS_ACCESS_KEY_ID=your_access_key
AWS_SECRET_ACCESS_KEY=your_secret_key
AWS_REGION=your_region

# GCP
GOOGLE_APPLICATION_CREDENTIALS=path_to_your_credentials.json
```

## Usage

```python
from cloud_manager.azure_client import AzureClient

# Initialize Azure client
azure_client = AzureClient(subscription_id="your_subscription_id")

# List VMs in a resource group
vms = azure_client.list_virtual_machines("my-resource-group")
for vm in vms:
    print(f"VM: {vm.name}")

# Create a new resource group
azure_client.create_resource_group("new-resource-group", "eastus")
```

## Project Structure

```
cloud_manager/
├── __init__.py
├── azure_client.py      # Azure-specific implementation
├── aws_client.py        # AWS-specific implementation (to be added)
├── gcp_client.py        # GCP-specific implementation (to be added)
└── cloud_interface.py   # Abstract base class for cloud providers
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

MIT 