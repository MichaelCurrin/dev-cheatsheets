# YAML


## What is YAML?

YAML stands for _YAML Ain't Markup Language_ according to the homepage.

Or _Yet Another Markup Language_, from an older [page](https://yaml.org/spec/history/2001-12-10.html) of the same site, from 2001.

It is a convenient way of storing data, typically for config files. YAML is supported in many programming languages - the homepage linked below covers libraries you can use.

The extension is either:

- `.yml`
- `.yaml`

Some use-cases include storing data for pages on a site like title and description, describing a CI workflow or setting up containers in a docker compose file.


## YAML vs JSON

YAML is a superset if JSON, so you can use JSON within YAML. But YAML is lighter in syntax making it easier to read and write. Especially for non-developers. It is light because you don't need quotes for keys or values, you don't need commas to separate lines and indentation is used for nested data like arrays or dictionaries, without having to use square or curly brackets.

From [history](https://yaml.org/spec/history/2001-08-01.html) in the docs:

> Yet Another Markup Language, abbreviated YAML, describes a class of data objects called YAML documents and partially describes the behavior of computer programs that process them.
>
> YAML documents encode into a serialized form information having a recursive null, scalar, map, or list structure. YAML also includes a method to encode references. At its core, a YAML document consists of a sequence of characters, some of which are considered part of the document's content, and others that are used to indicate structure within the information stream.


## Syntax


Sample content, going through data types:

- `foo.yml`
    ```yaml
    my_bool: true
    
    my_int: 123
    my_float: 123.4
    
    my_string_unquoted: ABC DEF
    my_string_quoted: "ABC DEF"
    my_string_quoted: 'ABC DEF'
    # Escape characters like single quotes using quotes.
    my_string_escaped: "That's my code"
    
    int_as_string: '123'
    bool_as_string: 'true'
    
    my_multi_line_string: |
      abc
      def

    my_array:
      - a
      - b
      - c
    # OR
    my_array: [ a, b, c]
    # OR
    my_array: [ "a", "b", "c" ]

    my_hash:
      a: 1
      b: 2
      c: 3
    # OR
    my_hash: { "a": 1, "b": 2, "c": 3 
    
    my_array_of_hashes:
      - a: 1
        b: 2
        c: 3
      - a: 100
        b: 200
      - a: 1000
      
    my_date: 2018-30-09
    my_datetime: 2020-10-01 09:10:30
    ```


## Resources

- Homepage: [yaml.org](https://yaml.org/)
- [Wikipedia](https://en.m.wikipedia.org/wiki/YAML)
- Validators
    - [YAML validator](https://codebeautify.org/yaml-validator)
    - [YAML Lint](http://www.yamllint.com/)
- Converters
    - [JSON to YAML](https://onlineyamltools.com/convert-yaml-to-json) - useful to check your YAML data got interpreted as expected. The JSON will be verbose but precise/explicit.
- [W3](https://www.tutorialspoint.com/yaml/index.htm) - this gives an intro and then builds up the rules of the syntax and examples.
