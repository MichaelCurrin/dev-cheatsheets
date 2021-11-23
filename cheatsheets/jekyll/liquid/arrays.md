# Arrays

{% raw %}

## Create


You can create a new array from an existing array or from a string that you split.

But you cannot create an empty array as `[]`. But, you can split an empty string. Or you can define an array in your frontmatter and then use that.

Define an array in frontmatter or a YAML file as:

```yaml
---
foo: ['abc', 'def', 'ghi', 'jkl', 123, true ]

# Or
foo:
 - abc
 - def
 - ghi
 - jkl
 - 123
 - true
---
```

Note that the YAML processor will treat booleans and numbers as those types, if not quoted.


## Read

```liquid
{{ my_array | first }}

{{ my_array[0] }}

{% assign my_var = my_array[0] %}

{{ my_array | last }}
```

Note - returns an array containing the one element.

```liquid
{{ my_array | slice: 0 }}
```


## Update

See filters:

- `push`
- `pop`
- `unshift`
- `shift`

e.g.

```liquid
---
my_array = []
---

{% assign my_array | push: 'abc' %}

{% assign my_array | push: 'def' %}

{{ my_array | inspect }}

<!-- ['abc', 'def'] -->
```

{% endraw %}
