---
title: Terraform
---

## Resources

- Homepage: [terraform.io](https://www.terraform.io/)
    > Use Infrastructure as Code to provision and manage any cloud, infrastructure, or service
- Download: [Downloads](https://www.terraform.io/downloads.html) page
- GitHub: [hashicorp/terraform](https://github.com/hashicorp/terraform)
    > Terraform enables you to safely and predictably create, change, and improve infrastructure. It is an open source tool that codifies APIs into declarative configuration files that can be shared amongst team members, treated as code, edited, reviewed, and versioned.
- [Commmands](https://www.terraform.io/docs/commands/index.html) in the docs.


## Usage

### Preview and deploy infrastructure

```sh
$ terraform init
```
```sh
$ terraform plan
```
```sh
$ terraform apply
```

### Development

Format the Terraform code.

```sh
$ terraform fmt
```

Validate the Terraform code.

```sh
$ terraform validate
```


### Alias

Recommended for shell config:

```sh
alias tf=terraform
```
