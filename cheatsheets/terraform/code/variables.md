---
title: Variables
---

See [Variables](https://www.terraform.io/docs/configuration/variables.html) in the docs.

Note you can't define variables in the REPL as per [issue](https://github.com/hashicorp/terraform/issues/19034) you can access existing variables and you can run functions on a literal.


## Types

### Basic

- `string`
- `number`
- `bool`

### Structures

- `list(<TYPE>)`
- `set(<TYPE>)`
- `map(<TYPE>)`
- `object({<ATTR NAME> = <TYPE>, ... })`
- `tuple([<TYPE>, ...])`


## Definition

```terraform
variable "image_id" {
  type        = string
  description = "..."
}
```

```terraform
variable "image_id" {
  type        = string
  description = "..."

  validation {
    condition     = can(regex("^foo-", var.image_id))
    error_message = "The image_id value must be a valid foo id, starting with \"foo-\"."
  }
}
```

## Maps

### Create

```terraform
{ a: 1 }
{ "a": 1 }
```

### Get

These will give an error if the key is not set, except for the last which sets a default value.

```terraform
bar.foo
bar["foo"]

lookup(bar, "foo")
# Set default.
lookup(bar, "foo", null)
```

Here, `bar` is of type `inputMap` and you need to use `.value` to get a map or you'll get an error.

```terraform
foo = lookup(bar.value, "foo")
foo = bar.value.foo
foo = bar.value["foo"]
```


## Dynamic blocks

Before of external modules, you might have to deprecate using an array.

```terraform
foo = [
  {
    a = 1
  },
  {
    a = 2
  }
]
```

And use a block instead:

```terraform
foo {
  a = 1
}
foo {
   = 2
}
```

You can convert an array into a block using the [dynamic block syntax](https://www.terraform.io/docs/configuration/expressions.html#dynamic-blocks).

```terraform
dynamic "foo" {
    for_each = var.foos
    content {
      a = foo.value["a"]
    }
}
```

Then you pass in `foos` as your array in your TF vars file and it will unpack each as a `foo` element. Each item in the for loop will use the name given such as `"foo"`.
