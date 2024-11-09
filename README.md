# Azure-Cloud with terraform

__terraform workflow__
* terraform init
* terraform fmt
* terraform validate
* terraform plan
* terraform apply
* terraform destroy

### terraform most used commands 
* terrafom init
* terraform fmt
* terraform validate
* terraform plan
* terraform apply
* terraform apply --auto-aprove
* terraform apply --var-file=name
* terraform destroy
* terraform plan --refresh-only
* terraform state show
* terraform state list
* terraform taint
* terraform workspace new <>
* terraform workspace selete <>
* terraform import 

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

**Terraform Lifecycle Hooks: Fine-Tuning Resource Management**

Terraform's lifecycle hooks provide a powerful mechanism to customize the behavior of resources during their creation and destruction. They allow you to execute specific actions or enforce certain conditions before or after these operations.

**Key Lifecycle Hooks:**

1. **`create_before_destroy`:**
   - **Purpose:** Ensures zero-downtime deployments by creating a new resource before destroying the old one.
   - **Use Case:** Ideal for resources that cannot be updated in-place, such as certain database instances or network configurations.
   - **Example:**
     ```terraform
     resource "aws_instance" "example" {
       # ... other configurations
       lifecycle {
         create_before_destroy = true
       }
     }
     ```

2. **`prevent_destroy`:**
   - **Purpose:** Prevents accidental destruction of critical resources.
   - **Use Case:** Useful for resources that are essential to your infrastructure and should not be removed without careful consideration.
   - **Example:**
     ```terraform
     resource "aws_security_group" "example" {
       # ... other configurations
       lifecycle {
         prevent_destroy = true
       }
     }
     ```

3. **`ignore_changes`:**
   - **Purpose:** Ignores specific attribute changes, preventing Terraform from triggering a resource replacement.
   - **Use Case:** Useful for attributes that are automatically managed by external systems or that you want to keep constant.
   - **Example:**
     ```terraform
     resource "aws_instance" "example" {
       # ... other configurations
       lifecycle {
         ignore_changes = [
           ami_id,
         ]
       }
     }
     ```

4. **`replace_triggered_by`:**
   - **Purpose:** Triggers a resource replacement when specific attribute changes occur, even if those attributes are normally immutable.
   - **Use Case:** Useful for scenarios where you want to force a replacement based on certain conditions.
   - **Example:**
     ```terraform
     resource "aws_instance" "example" {
       # ... other configurations
       lifecycle {
         replace_triggered_by = ["ami_id"]
       }
     }
     ```
### topics

1. variable 
2. vm creations 
3. using data sources accessing azure key vaults 
4. access the other subscriptions resources in terraform 
5. movie state file to remote storage Account?
6. vnet peering connection 
7. using null resources and file, remote-exec provisioner.
 in terraform function -login function 
 triggering the code 
8. terraform taint with null_resources 
9. pushing code to remote repo and download to Linux server.
10. how multiple users can access same state and how state locking works
11. debugging and logging in terraform
``` 
$env:TF_LOG=TRACE / export TF_LOG=TRACE

$env:TF_LOG_PATH="Terraform_Info.log" / export TF_LOG_PATH="Terraform_Info.log"

disable to
$env:TF_LOG="" 
```

==> enable on state using multipole people execute corrupted to state file 


12. terraform life cycle 
13. terraform workspaces 
14. terraform workspaces 
15. terraform functions

## terraform functions 
	- count
	- conditions
terraform lb
terraform azure dns data sources
terraform import 
terraform functions 
 
__difference between data sources vs terraform import__



###  **terraform taint**
   - Marks a specific resource as “tainted,” forcing it to be destroyed and recreated on the next `terraform apply`. Useful when a resource is in an unhealthy or inconsistent state.

   ```bash
   terraform taint <resource_address>
   ```

###  **terraform untaint**
   - Clears the “tainted” state on a resource, ensuring it won’t be recreated in the next apply. This is useful if you decide the resource doesn’t need to be replaced.

   ```bash
   terraform untaint <resource_address>
   ```

###  **terraform workspace**
   - Manages multiple workspaces (environments) within a single configuration directory. Workspaces are often used to manage separate states for different environments, like `development`, `staging`, and `production`.

   - **Examples**:
     ```bash
     terraform workspace list           # Lists all workspaces
     terraform workspace new <name>     # Creates a new workspace
     terraform workspace select <name>  # Switches to a specific workspace
     ```
###  terraform import
Imports an existing resource into Terraform's state without actually modifying the resource itself. This is used to bring infrastructure created outside of Terraform into Terraform's management.
```bash

terraform import <resource_address> <resource_id>
```
### Summary of Key Commands
| Command             | Purpose                                                                                   |
|---------------------|-------------------------------------------------------------------------------------------|
| `terraform init`    | Initializes configuration directory                                                       |
| `terraform plan`    | Previews changes                                                                          |
| `terraform apply`   | Provisions or updates resources                                                           |
| `terraform destroy` | Removes all resources                                                                     |
| `terraform validate`| Checks configuration validity                                                             |
| `terraform fmt`     | Formats configuration files                                                               |
| `terraform state`   | Manages Terraform state                                                                   |
| `terraform output`  | Displays defined outputs                                                                  |
| `terraform import`  | Imports external resources into Terraform                                                 |
| `terraform refresh` | Syncs state with infrastructure                                                           |
| `terraform taint`   | Forces resource recreation                                                                |
| `terraform untaint` | Clears taint, retaining the resource                                                      |
| `terraform workspace`| Manages multiple workspaces for separate environments                                    |

Using these commands effectively can streamline your infrastructure management and keep configurations and deployments well-organized.

