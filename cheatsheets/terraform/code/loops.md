# Loops


## for loop

- [for Expressions](https://www.terraform.io/docs/language/expressions/for.html) in the docs

### Syntax

```terraform
[for ITEM in ITERABLE : EXPRESSION_USING_ITEM]
```

Iterate over a map of keys and values:

```terraform
[for k, v in var.map : length(k) + length(v)]
```

Iterate of a list, using an optiona index.

```terraform
[for i, v in var.list : "${i} is ${v}"]
```

Convert a list into a map:

```terraform
{for s in var.list : s => upper(s)}
```

Sample result:

```
{
  foo = "FOO"
  bar = "BAR"
  baz = "BAZ"
}
```

### Examples

Get an attribute:

```terraform
[for x in var.my_var : x.my_attribute]
```

Using a function:

```terraform
[for x in var.my_var : chomp(x)]
```

Using a filter:

```terraform
[for word in var.word_list : upper(word) if word != "coffee"]
```

Given an array:

```terraform
[ 
  { name = "Foo"}, 
  { name = "Bar"} 
]
```

You could get all the names as:

```terraform
[for o in var.people : x.name]
```

Or the more succint _splat_:

```terraform
var.people[*].name
```

Result:

```
["Arthur", "Martha"]

```

## for_each

- [for_each](https://learn.hashicorp.com/tutorials/terraform/for-each) in the docs

Set `for_each` as an attribute on a resource or module.

### Array

For an array, you can use `each.index`.

```terraform
module "my_module" {
  for_each = var.subpaths
  message = "Problem reaching page: ${var.subpaths[each.index]}"
}
```

### Map and set

If you have a `map` or `set`, then you can reference using `each.key` and `each.value`. You can use `toset` to convert an array to a set - though this will mean order is not guaranteed and that any duplicates will be removed.

Here using `each.key` and `each.value` to get keys and values of a map.

```terraform
my_map = {
 foo = "bar",
 fizz = "buzz"
}
 
resource "test_resource" "abc" {
 for_each = var.my_map
 
 my_key = each.key      # e.g. "foo"
 my_value = each.value  # e.g. "bar"
}
```

Here, flattening some nested values. Based on [article](https://spacelift.io/blog/terraform-functions-expressions-loops).

```terraform
my_instances = {
 instance_1 = {
   ami   = "ami-00124569584abc",
   type  = "t2.micro"
 },
 instance_2 = {
   ami   = "ami-987654321xyzab",
   type  = "t2.large"
 },
}
 
resource "aws_instance" "test" {
 for_each = var.my_instances
 
 ami           = each.value["ami"]
 instance_type = each.value["type"]
}
```

For an array, you need to convert it to a set first with `toset`.

This has duplication of the URL value. And that can't be broken out as in variables or locals because `for_each` references _must_ be inside a module or resource.

```terraform
module "my_module" {
  for_each    = toset(var.subpaths)
  name        = local.organic_name
  message     = "Problem reaching page: ${local.url_prefix}${var.main_url}/${each.key}"
  url         = "${local.url_prefix}${var.main_url}/${each.key}"
}
```

So, to avoid duplication:

```terraform
module "my_module" {
  for_each = toset([for subpath in var.subpaths : "${local.url_prefix}${var.main_url}/${subpath}"])

  message     = "Problem reaching page: ${each.value}"
  url    = each.value
}
```
