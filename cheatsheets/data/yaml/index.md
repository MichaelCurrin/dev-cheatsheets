# YAML

YAML stands for Yet Another Markup Language. It is a convenient way of storing data, typically for config files. YAML is supported in many programming languages - the homepage linked below covers libraries you can use.

Some use-cases include storing data for pages on a site like title and description, describing a CI workflow or setting up containers in a docker compose file.

YAML is a superset if JSON, so you can use JSON within YAML. But YAML is lighter in syntax making it easier to read and write. Especially for non-developers. It is light because you don't need quotes for keys or values, you don't need commas to separate lines and indentation is used for nested data like arrays or dictionaries, without having to use square or curly brackets.

### Resources

- Homepage: [yaml.org](https://yaml.org/)
- [YAML validator](https://codebeautify.org/yaml-validator)
- [JSON to YAML](https://onlineyamltools.com/convert-yaml-to-json) - useful to check your YAML data got interpreted as expected. The JSON will be verbose but precise/explicit.
