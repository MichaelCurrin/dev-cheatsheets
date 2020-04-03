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
`-o --output <file>` | Write to file.
`-u user:pass` | User authentication.
`-v --verbose` | Verbose
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

## Resources

- [httpie.org](https://httpie.org/) - homepage, with good examples there.
- [HTTPie docs](https://httpie.org/doc).
- [jakubroztocil/httpie](https://github.com/jakubroztocil/httpie/) repo on Github.
- [HTTpie cheatsheet](https://devhints.io/httpie) on DevHints.


### Install

```
<tool> install httpie
```

Note you install using `httpie` but the command you use is `http`.
 
### GET

```sh
http httpbin.org/get
```

### POST

```sh
http -f POST httpbin.org/post hello=World
```

## Wget

- [GNU Wget homepage](https://www.gnu.org/software/wget/)
- [Tutorial](https://www.computerhope.com/unix/wget.htm)
- [Cheatsheet](https://gist.github.com/Dammmien/4af98e05f9c51c2da007cc70d62bf562) gist.

### Install

Debian/Ubuntu:

```sh
sudo apt-get install wget
```

macOS:

```sh
brew install wget
```

### Download a file

```sh
wget http://website.com/files/file.zip
```
