# JSON cheatsheet


## Resources

- [json.org](https://www.json.org)
- [JSON](https://www.w3schools.com/js/js_json_intro.asp) on W3 Schools.
- [Jsonnet](https://jsonnet.org/)
- [JSONP](https://www.w3schools.com/js/js_json_jsonp.asp)


## Conversion

From JSON-formatted string to object and then from object back to JSON-formatted string.

### JavaScript

No imports needed.

```javascript
JSON.parse(myString);
```

```javascript
JSON.stringify(myObject);
```

### Ruby

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

### Jekyll

- [Jekyll Liquid filters](https://jekyllrb.com/docs/liquid/filters/)

```
{{ my_object | jsonify }}
```

### Python

- [Reading and writing JSON to a file in Python](https://stackabuse.com/reading-and-writing-json-to-a-file-in-python/) on StackAbuse.
- [Reading and writing JSON to a file in Python](https://www.geeksforgeeks.org/reading-and-writing-json-to-a-file-in-python/) on Geeks for Geeks.

Import the builtin.

```python
import json
```

#### Object handling

Read from and write to object - note the `s` in the method name.

```python
my_obj = json.loads(my_string)
```

```python
my_string = json.dumps(my_obj)
```

#### File handling

Read from and write to file - note **no* `s` in the method names.

```python
with open('file.json') as f_in:
    my_obj = json.load(f_in)
```

```python
with open('file.json', 'w') as f_out:
    json.dumps(my_object, f_out)
```


### Flask

A Python library for websites and APIs. It supports templating using HTML files with Liquid syntax, similar to Jekyll.

- [Flask docs](https://flask.palletsprojects.com/en/master/)
- [Tutorial](https://www.pythonanywhere.com/forums/topic/1627/)
 
```
{{ my_object | tojson }}
```

Depending how you want certain characters to appear, you might use the `safe` filter.

```
{{ string | tojson | safe}}
```
