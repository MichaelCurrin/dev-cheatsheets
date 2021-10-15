# Types


From [Types](https://www.terraform.io/docs/language/expressions/types.html) in the docs.


## Types

### Basic

- `string`: a sequence of Unicode characters representing some text, like `"hello"`.
- `number`: a numeric value. The number type can represent both whole numbers like `15` and fractional values like `6.283185`.
- `bool`: a boolean value, either `true` or `false`. `bool` values can be used in conditional logic.

### Structures

- `list<TYPE>` a sequence of values, like `["us-west-1a", "us-west-1c"]`. Elements in a list or tuple are identified by consecutive whole numbers, starting with zero.
- `tuple([<TYPE>, ...])` - same as `list` but frozen.
- `set(<TYPE>)`
- `map<TYPE, TYPE>` (or `object`): key-value pairs. `{name = "Mabel", age = 52}`. 
- `object({<ATTR NAME> = <TYPE>, ... })`

e.g.

```terraform
variable "my_var" {
  type        = list(string)
  default     = ["abc"]
}
```

### Special

- `null` - a value that represents absence or omission.
