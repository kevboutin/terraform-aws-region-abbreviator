# terraform-aws-region-abbreviator-
This terraform module provides a way to get a meaningful abbreviated version for a region in AWS.
For example, "eastus2" becomes "eus2". This module also always outputs a map for every region, which allows you to do multiple at once.

This module does not communicate with AWS in any way.

## Usage

Basic usage of this module is as follows:

```hcl
module "utils" {
  source  = "terraform-aws-region-abbreviator/utils/aws"
  version = "~> 0.3"
  region  = "us-east-2"
}

locals {
  "use2" = module.utils.region_short_name
  "euw1" = module.utils.region_short_name_map["eu-west-1"]
}
```

The above results in locals with computed values of:

```
locals {
  "us-east-2" = "use2"
  "eu-west-1" = "euw1"
}
```

Functional examples are included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_regions | A user-supplied list of regions to extend the lookup map. | `list(string)` | `[]` | no |
| region | The AWS region to retrieve a short name for (ex. `us-east-2`). | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| region\_short\_name | The two to four character shortname of the region specified in var.region. |
| region\_short\_name\_map | The two to four character shortname of any given region. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] >= v0.12, < v0.14

### ABAC

An AWS ABAC is not needed for to use this module.

### APIs

Projects/APIs are not required to use this module.

## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.
