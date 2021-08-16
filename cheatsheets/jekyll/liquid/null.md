# Null

## Null values in frontmatter

```liquid
---
empty_value:

null_value: null

empty_string: ''

empty_array: []
---
{{ page | jsonify }}
```

```json5
{
  "empty_value":null,
  "nil_value":  null,
  "empty_string":"",
  "empty_array":[],
  // ...
}
```

Notes:

- You can use an empty value or `null` in your frontmatter or YAML files.
- `nil` will become `"nil"`, but in plain YAML outside of Jekyll you would use `nil`. 
- You can also use null forms of chosen types.


## Layouts

For layouts, you can use a special built-in `none` layout:

```liquid
---
layout: none
---
```

It is not really a null value, as it is still as string.

