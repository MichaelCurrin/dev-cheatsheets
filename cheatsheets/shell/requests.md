# Shell requests cheatsheet


## Curl

### Resources

- [Curl cheatsheet](https://devhints.io/curl) on DevHints.
- [Curl POST examples](https://gist.github.com/subfuzion/08c5d85437d5d4f00e58) gist.
- [Curl manual](https://curl.haxx.se/docs/manual.html) on [curl.haxx.se](https://curl.haxx.se).
- [Curl manpage](https://curl.haxx.se/docs/manpage.html) on [curl.haxx.se](https://curl.haxx.se).
- [Curl manpage](https://linux.die.net/man/1/curl) on [Linux.die.net](https://Linux.die.net).


Flag | Description
---  | ---
`-L` | Follow redirect.
`-o <file>` | Or `--output`. Write to file.
`-u user:pass` | User authentication.
`-v` | Verbose
`-vv` | More verbose.
`-s` | Silent


## POST

The `-X POST` flag is implied.

### Send form data

```
-d <key>=<value>[<key>=<value>...]
```

```sh
curl http://example.com -d 'foo=bar,fizz=buzz'
```

Use `-G` to send data via get.

### Send JSON data

```sh
`-d <json-data>
```

Example:

```sh
curl http://example.com -d '{"foo": "bar", "fizz": "buzz"}' -H "Content-Type: application/json"
```


### Send a file

```
-d @<path>
```

Example

```sh
curl -d @file.txt http:example.com
```

### Headers

- `-H "Content-Type: application/x-www-form-urlencoded"`
- `-H "Content-Type: application/json"`


## HTTPie

Simpler to use than curl and it prettifies JSON and HTML output with colors and wrapping.

- [httpie.org](https://httpie.org/) - homepage, with good examples there.
- [httpie docs](https://httpie.org/doc)

### Install

```
<tool> install httpie
```

Note you install using `httpie` but the command you use is `http`.
 
### GET

```
http httpbin.org/get
```

### POST

```
http -f POST httpbin.org/post hello=World
```
