# Loops

## for_each

- [for_each](https://learn.hashicorp.com/tutorials/terraform/for-each) in the docs

### Array

For an array, you can use `each.index`.

Untested code:

```terraform
module "my_module" {
  for_each = var.subpaths
  message = "Problem reaching page: ${var.subpaths[each.index]}"
}
```

### Map and set

If you have a `map` or `set`, then you can reference using `each.key` and `each.value`. You can use `toset` to convert an array to a set - though this will mean order is not guaranteed and that any duplicates will be removed.

Tested examples

This can duplication of the URL value. And that can't be broke out as in variables or locals because for_each references must be inside a module or resource.

```terraform
module "my_module" {
  for_each    = toset(var.subpaths)
  name        = local.organic_name
  message     = "Problem reaching page: ${local.url_prefix}${var.main_url}/${each.key}"
  url    = "${local.url_prefix}${var.main_url}/${each.key}"
}
```

Or to avoid duplication:

```terraform
module "my_module" {
  for_each = toset([for subpath in var.subpaths : "${local.url_prefix}${var.main_url}/${subpath}"])

  message     = "Problem reaching page: ${each.value}"
  url    = each.value
}
```
