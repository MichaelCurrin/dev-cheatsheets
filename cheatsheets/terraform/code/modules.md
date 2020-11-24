# Modules

[Modules](https://www.terraform.io/docs/configuration/modules.html) in the docs.

> A module is a container for multiple resources that are used together.


## Basic

```tf
module "servers" {
  source = "./app-cluster"

  servers = 5
}
```

Reference module output.

```tf
resource "aws_elb" "example" {
  # ...

  instances = module.servers.instance_ids
}
```


## Module versions

Use a version number when referencing a module that is in a GitHub repo or the Terraform package registry.

```tf
module "consul" {
  source  = "hashicorp/consul/aws"
  version = "0.0.5"

  servers = 3
}
```

## Multiple instances of a module

From TF `0.13`.

- `my_buckets.tf`
    ```tf
    module "bucket" {
      for_each = toset(["assets", "media"])
      source   = "./publish_bucket"
      name     = "${each.key}_bucket"
    }
    ```
- `publish_bucket/bucket-and-cloudfront.tf`
    ```tf
    variable "name" {} # this is the input parameter of the module

    resource "aws_s3_bucket" "example" {
      # Because var.name includes each.key in the calling
      # module block, its value will be different for
      # each instance of this module.
      bucket = var.name

      # ...
    }

    resource "aws_iam_user" "deploy_user" {
      # ...
    }
    ```
    
## Providers within submodules

```tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
    }
  }
}
```
