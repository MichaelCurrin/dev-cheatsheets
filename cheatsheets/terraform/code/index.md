---
title: Code
description: How to write code for Terraform files
---

The native language of Terraform is HCL - Hashicorp Configuration Language.


Recommended - use this command to start interactive mode.

```sh
$ terraform console
```

Then enter Terraform statements.

```
> join(", ", ["abc","def"])
"abc, def"
```
