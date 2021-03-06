# terraform-icon-gcp-prep
New all in one module for ICON Blockchain P-Rep nodes on GCP

## Features

This module...

## Terraform Versions

For Terraform v0.12.0+

## Usage

```
module "this" {
    source = "https://github.com/highlloyd/terraform-icon-gcp-prep"

}
```
## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| google | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| ansible\_hardening | Run hardening roles | `bool` | `false` | no |
| create | Boolean to make module or not | `bool` | `true` | no |
| create\_eip | Boolean to create elastic IP | `bool` | `false` | no |
| id | The id of the deployment | `string` | `""` | no |
| instance\_type | Instance type | `string` | `"n1-standard-1"` | no |
| key\_name | The name of the preexisting key to be used instead of the local public\_key\_path | `string` | `""` | no |
| keystore\_password | The password to the keystore | `string` | `""` | no |
| keystore\_path | The path to the keystore | `string` | `""` | no |
| labels | Map of labels | `map(string)` | `{}` | no |
| monitoring | Boolean for cloudwatch | `bool` | `false` | no |
| name | Name of the resources | `string` | `""` | no |
| network\_name | The network name, ie kusama / mainnet | `string` | `"testnet"` | no |
| node\_name | Name of the node | `string` | `""` | no |
| playbook\_vars | Additional playbook vars | `map(string)` | `{}` | no |
| private\_key\_path | The path to the private ssh key | `string` | `""` | no |
| private\_subnet\_id | The id of the private subnet | `string` | n/a | yes |
| public\_ip | The public IP, leave blank to query IP from name (bucket name by default in registration) | `string` | `""` | no |
| public\_key\_path | The path to the public ssh key | `string` | `""` | no |
| public\_subnet\_id | The id of the public subnet | `string` | n/a | yes |
| root\_volume\_size | Root volume size | `string` | `0` | no |
| security\_group\_id | The id of the security group to run in | `string` | n/a | yes |
| tags | List of tags | `list(string)` | `[]` | no |
| zone | The GCP zone to deploy in | `string` | `"us-east1-b"` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_id | n/a |
| private\_ip | n/a |
| private\_subnet\_id | n/a |
| public\_ip | n/a |
| public\_subnet\_id | n/a |
| security\_group\_id | n/a |
| user\_data | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root