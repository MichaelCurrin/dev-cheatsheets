---
title: Plans
description: Working with plans in TF
---

- [Plan commands](https://www.terraform.io/docs/commands/plan.html) docs.

Generate plan on the console output with colors.

```sh
$ terraform plan
```

Or if you want to persist the plans.

```sh
$ mkdir -p plans
```

Write out to human-readable plain text file.

```sh
$ terraform plan --no-color > plans/foo.txt
```

Use `&>` instead of `>` to include `stderr`.

We strip colors to avoid messages like `[0m[1m[32mNo changes. Infrastructure is up-to-date.[0m[32m`

Write out binary plan file.

```sh
$ terraform plan -out plans/foo.tfplan
```

That can be viewed using:

```sh
$ terraform show plans/foo.tfplan
```

For JSON output:

```sh
$ terraform show -json <planfile>
```

From [JSON Format](https://www.terraform.io/docs/internals/json-format.html) TF doc.

You can apply a plan directly, which saves TF doing a plan internally within the apply step.

```sh
$ terraform apply plans/foo.tfplan
```

Or for a target directory.

```sh
$ terraform apply DIR
```
