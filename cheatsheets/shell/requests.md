# Shell requests

How to download or upload content at a URL using terminal tools.

**Table of contents**

<!-- TODO break out into separate files -->

- [curl](#curl)
- [httpie](#httpie)
- [wget](#wget)


## Curl

When formatting a URL to request, ensure you escape it. For example `#` would turn the rest of the line into a comment.

### Ignore invalid cert

```sh
$ curl -k URL
```

### Request multiple files

Example below with braces expansion supported by curl - more succinct than writing a `for` loop. Note characters are escaped (some shells like ZSH will do this for you).

```sh
$ curl 'http:example.com/{foo,bar}#baz'

$ # OR
$ curl http:example.com/\{foo,bar\}\#baz
```

### Resources

- [Curl homepage](https://curl.haxx.se/)
    >  command line tool and library for transferring data with URLs
- [Curl cheatsheet](https://devhints.io/curl) on DevHints.
- [Curl POST examples](https://gist.github.com/subfuzion/08c5d85437d5d4f00e58) gist.
- [Curl manual](https://curl.haxx.se/docs/manual.html) on [curl.haxx.se](https://curl.haxx.se).
- [Curl manpage](https://curl.haxx.se/docs/manpage.html) on [curl.haxx.se](https://curl.haxx.se).
- [Curl manpage](https://linux.die.net/man/1/curl) on [Linux.die.net](https://Linux.die.net).


| Flag                   | Description                                                                                                                                                |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-L`                   | Follow redirect.                                                                                                                                           |
| `-o --output FILEPATH` | Write to named filepath. [manpage](https://curl.haxx.se/docs/manpage.html#-o)                                                                              |
| `-O, --remote-name`    | Write to a file in the current directory using the remote's filename. This will use '%20' for spaces. [manpage](https://curl.haxx.se/docs/manpage.html#-O) |
| `-u user:pass`         | User authentication.                                                                                                                                       |


### Verbosity

| Flag           | Description   |
| -------------- | ------------- |
| `-v --verbose` | Verbose       |
| `-vv`          | More verbose. |
| `-s`           | Silent        |


### Saving output

```sh
curl http > dir/file.txt
```

```sh
curl URL -o dir/file.txt

# Multiple files and use the variable input in the output.
curl "http://{one,two}.example.com" -o "file_#1.txt"
```

Use the remote resource's name.

```sh
curl http://example.com/foo.html -O
# foo.html

# Download multiple files.
curl 'http://example.com/{foo.html,bar.html}' -O
```


### POST reuqest

The `-X POST` flag is implied if you add data.

#### Send form data

```
-d <key>=<value>[<key>=<value>...]
```

```sh
$ curl http://example.com \
    -d 'foo=bar,fizz=buzz'
```

Use `-G` to send data via get.

#### Send JSON data

```
-d <json-string>
```

Example:

```sh
$ curl http://example.com \
    -d '{"foo": "bar", "fizz": "buzz"}' \
    -H "Content-Type: application/json"
```

#### Upload a file

```
-d @<path-to-file>
```

Example

```sh
$ curl http:example.com \
    -d @file.txt
```

#### Headers

- `-H "Content-Type: application/x-www-form-urlencoded"`
- `-H "Content-Type: application/json"`

#### Show just header

- `-I` `--head`


## HTTPie

Simpler to use than curl and it prettifies JSON and HTML output with colors and wrapping.

## Resources

- [httpie.org](https://httpie.org/) - homepage. There are great usage examples there.
    > HTTPie is a command line HTTP client that will make you smile.
- [HTTPie docs](https://httpie.org/doc)
- [HTTPie demo](https://httpie.org/run)
- [jakubroztocil/httpie](https://github.com/jakubroztocil/httpie/) repo on GitHub.
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
- [Manual](http://www.gnu.org/software/wget/manual/wget.html)
- [Tutorial](https://www.computerhope.com/unix/wget.htm)
- [Cheatsheet](https://gist.github.com/Dammmien/4af98e05f9c51c2da007cc70d62bf562) gist.

### Install

Debian/Ubuntu:

```sh
$ sudo apt-get install wget
```

macOS:

```sh
$ brew install wget
```

### Usage

### Help

```
wget --help
```

```
GNU Wget 1.20.3, a non-interactive network retriever.
```
```
Usage: wget [OPTION]... [URL]...
```

Some useful options.

```
  -o,  --output-file=FILE          log messages to FILE
  -a,  --append-output=FILE        append messages to FILE
  -q,  --quiet                     quiet (no output)
  -v,  --verbose                   be verbose (this is the default)
```

```
  -O,  --output-document=FILE      write documents to FILE

  -nc, --no-clobber                skip downloads that would download to
                                     existing files (overwriting them)
```

```
  -i,  --input-file=FILE           download URLs found in local or external FILE
```

```
       --spider                    don't download anything
```

```
Recursive download:
  -r,  --recursive                 specify recursive download
  -l,  --level=NUMBER              maximum recursion depth (inf or 0 for infinite)
```

```
  -D,  --domains=LIST              comma-separated list of accepted domains
       --exclude-domains=LIST      comma-separated list of rejected domains
```

#### Download a file

With no flags, you'll get the file downloaded.

```sh
wget http://website.com/files/file.zip
```

Change the output path or filename.

```sh
wget http://website.com/files/file.zip -O myfile.zip
```

#### Print output

Specify no output file. This behaves like the default behavior of `curl`.

This can be useful for piping text at endpoint to another tool.

```sh
wget -q -O - "https://api.github.com/repos/MichaelCurrin/badge-generator/releases/latest"
```

### Spider

```sh
wget -r -l4 –spider -D example.com https://example.com
```

From the manual:

> When invoked with this option, Wget will behave as a Web spider, which means that it will not download the pages, just check that they are there. For example, you can use Wget to check your bookmarks:

```sh
wget --spider --force-html -i bookmarks.html
```
