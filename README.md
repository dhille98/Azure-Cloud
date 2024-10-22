# Azure-Cloud with terraform

__terraform workflow__
* terraform init
* terraform fmt
* terraform validate
* terraform plan
* terraform apply

---
other commands :
    - terraform plan --refresh-only
    - terraform destroy
    - terraform state list
    - 

### Bash

```bash
export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
export ARM_TENANT_ID="<azure_subscription_tenant_id>"
export ARM_CLIENT_ID="<service_principal_appid>"
export ARM_CLIENT_SECRET="<service_principal_password>"
```
```ps1
$env:ARM_CLIENT_ID="<service_principal_app_id>"
$env:ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
$env:ARM_TENANT_ID="<azure_subscription_tenant_id>"
$env:ARM_CLIENT_SECRET="<service_principal_password>"
```

### terraform life cycle hooks

create-before-destroy = 'false' this is default nather