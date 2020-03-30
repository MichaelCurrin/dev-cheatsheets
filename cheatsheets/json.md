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

Or

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
