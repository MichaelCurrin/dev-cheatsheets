---
description: Shell tools for parsing JSON to prettify or get values
---
# Shell processing


## Using Python JSON tool

```sh
$ python -m json.tool [inline] [outfile]
```

```sh
$ python -m json.tool file.json
```

Useful if posting from clipboard.

```sh
$ echo '{"foo":1}' | python -m json.tool
```
```json
{
    "foo": 1
}
```

## Using JavaScript JQ tool

Homepage: [stedolan.github.io/jq/](https://stedolan.github.io/jq/)

Example:

```sh
URL='https://api.github.com/repos/stedolan/jq/commits?per_page=5'
curl "$URL" | jq '.'
```

```sh
curl "$URL" | jq '.[0] | {message: .commit.message, name: .commit.committer.name}'
```

## Using JSON CLI

Homepage: [trentm.com/json/](https://trentm.com/json/)

Repo: [trentm/json](https://github.com/trentm/json)

This tool is a Node.js tool with no external dependencies.

```sh
$ npm install -g json
$ json --version
json 9.0.0
```

```
NAME

json - JSON love for your command line
SYNOPSIS

something-generating-JSON-on-stdout | json [OPTIONS] [LOOKUPS]

json -f FILE [OPTIONS] [LOOKUPS...]
```

Sample usage:

```sh
$ echo '{"foo":"bar"}' | json
{
  "foo": "bar"
}
```
```sh
$ echo '{"foo":"bar"}' | json foo
bar
```
