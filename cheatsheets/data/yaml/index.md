# YAML

YAML stands for YAML Ain't Markup Langauge according to the homepage, or Yet Another Markup Language on an older page of the site from 2001.

It is a convenient way of storing data, typically for config files. YAML is supported in many programming languages - the homepage linked below covers libraries you can use.

Some use-cases include storing data for pages on a site like title and description, describing a CI workflow or setting up containers in a docker compose file.

YAML is a superset if JSON, so you can use JSON within YAML. But YAML is lighter in syntax making it easier to read and write. Especially for non-developers. It is light because you don't need quotes for keys or values, you don't need commas to separate lines and indentation is used for nested data like arrays or dictionaries, without having to use square or curly brackets.

From [history](https://yaml.org/spec/history/2001-08-01.html) in the docs:

> Yet Another Markup Language, abbreviated YAML, describes a class of data objects called YAML documents and partially describes the behavior of computer programs that process them.
>
> YAML documents encode into a serialized form information having a recursive null, scalar, map, or list structure. YAML also includes a method to encode references. At its core, a YAML document consists of a sequence of characters, some of which are considered part of the document's content, and others that are used to indicate structure within the information stream.

### Resources

- Homepage: [yaml.org](https://yaml.org/)
- [Wikipedia](https://en.m.wikipedia.org/wiki/YAML)
- [YAML validator](https://codebeautify.org/yaml-validator)
- [JSON to YAML](https://onlineyamltools.com/convert-yaml-to-json) - useful to check your YAML data got interpreted as expected. The JSON will be verbose but precise/explicit.
- [W3](https://www.tutorialspoint.com/yaml/index.htm) - this gives an intro and then builds up the rules of the syntax and examples.
