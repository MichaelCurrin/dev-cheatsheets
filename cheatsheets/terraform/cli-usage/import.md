---
title: Import
description: How to import resources in TF
---

See [import](https://www.terraform.io/docs/commands/import.html) command in the docs.

```sh
$ terraform import RESOURCE_TYPE.NAME ID
```

```sh
$ terraform import module.MODULE_NAME.RESOURCE_TYPE.NAME ID
```

```sh
$ terraform import 'RESOURCE_TYPE.NAME[0]' ID
$ # e.g.
$ terraform import 'datadog_synthetics_test.this[0]' ID
$ terraform import 'module.my_module[0].datadog_synthetics_test.this' ID
```
