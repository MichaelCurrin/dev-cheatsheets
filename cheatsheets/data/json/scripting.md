---
title: Scripting
description: How to handle JSON data in a scripting language
---

Within a programming language, convert a JSON-formatted string to data structure and then back to a string.

See also [JSON](https://github.com/MichaelCurrin/learn-to-code/blob/master/data_formats.md#json) section of my data formats guide.


## JavaScript

No imports needed.

```javascript
JSON.parse(myString);
```

```javascript
JSON.stringify(myObject);
```

Prettify with indentation.

```javascript
JSON.stringify(results, null, 4)
```

In NodeJS on the command-line:

```javascript
> var package = require('./package.json')
> package.version
"1.0.0"
```


## Ruby

- [Ruby JSON module](https://ruby-doc.org/stdlib-2.6.3/libdoc/json/rdoc/JSON.html)


Import a builtin:

```ruby
require 'json'
```

```ruby
JSON.parse my_string
```


```ruby
JSON.generate my_object
```

```ruby
JSON.pretty_generate my_object
```

Or on an object. Also needs the import as above to add this method.

```ruby
my_string.to_json

{:hello => "world"}.to_json
# => "{\"hello\":\"world\"}"
```


## Jekyll

- [Jekyll Liquid filters](https://jekyllrb.com/docs/liquid/filters/)

```
{{ my_object | jsonify }}
```


## Python

- [Reading and writing JSON to a file in Python](https://stackabuse.com/reading-and-writing-json-to-a-file-in-python/) on StackAbuse.
- [Reading and writing JSON to a file in Python](https://www.geeksforgeeks.org/reading-and-writing-json-to-a-file-in-python/) on Geeks for Geeks.

Import the builtin.

```python
import json
```

### Object handling

Read from and write to object - note the `s` in the method name.

```python
my_obj = json.loads(my_string)
```

```python
my_string = json.dumps(my_obj)
```

### File handling

Read from and write to file - note **no* `s` in the method names.

```python
with open('file.json') as f_in:
    my_obj = json.load(f_in)
```

```python
with open('file.json', 'w') as f_out:
    json.dumps(my_object, f_out)
```

## Pretty print

Be sure to specify wrapping indentation level at 4 spaces to make the output appear more vertical than horizontal.

```python
print(json.dumps(my_obj, indent=4)
```

Alternatively, use the `pprint` built which will also wrap data stuctures for easy reading but does not impose JSON on everything. For example, JSON does not handle datetime object so you'd have to stringify those with `str(value)` _before_ you convert to JSON.

```python
import pprint
```

Using a function:

```python
pprint.pprint(my_object)

# Width is in number of characters.
pprint.pprint(my_object, depth=1, width=60)
```

Using a class:

```python
pp = pprint.PrettyPrinter(width=60, compact=True)
pp.pprint(my_object)

pp = pprint.PrettyPrinter(indent=4)
pp.pprint(my_object)
```

## Flask

A Python library for websites and APIs. It supports templating using HTML files with Liquid syntax, similar to Jekyll.

- [Flask docs](https://flask.palletsprojects.com/en/master/)
- [Tutorial](https://www.pythonanywhere.com/forums/topic/1627/)

```
{{ my_object | tojson }}
```

Depending how you want certain characters to appear, you might use the `safe` filter.

```
{{ string | tojson | safe }}
```
