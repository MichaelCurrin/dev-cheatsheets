---
title: curl

cli:
  usage: |
    curl [OPTIONS...] URL

  flags:
    - flag: |
        `-I, --head`
      description: |
        Show headers only

        "Show document info only"
      example:
    - flag: |
        `-v`
      description: Verbose
    - flag: |
        `-L`
      description: Follow redirects.
    - flag: |
        `-H, --header HEADER`
      description: Request headers.
      example: |
        `-H 'Content-Type: application/json'`
    - flag: |
        `-X, --request TYPE`
      description: Request type. Note that passing data with `-d` automatically generates a POST.
      example: |
        `-X POST`
    - flag: |
        `-d, --data DATA`
      description: Pass data in a request. Typically JSON or form data in a POST.
      example: |
        `--data 'foo=bar;bazz=123`

        `--data '{"foo": "bar", "bazz": 123}' -H 'Content-Type: application/json'`
    - flag: |
        `-F FIELD=VALUE`
      description: Send field
      example: |
        `-F 'foo=bar' 'bazz=123'`
    - flag: |
        `-u, --user USER:PASSWORD`
      description: Server user and password
    - flag: |
        `-A, --user-agent NAME`
      description: Send User-Agent value
      example: |
        `curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0" https://example.com/"`

---


## Resources

- [curl](https://linux.die.net/man/1/curl) manpage on Linux Die site.


## Help

```console
$ curl --help
  Usage: curl [options...] <url>
     --abstract-unix-socket <path> Connect via abstract Unix domain socket
     --alt-svc <file name> Enable alt-svc with this cache file
     ...
```

```console
$ man curl
NAME
       curl - transfer a URL

SYNOPSIS
       curl [options / URLs]

DESCRIPTION
       curl  is a tool to transfer data from or to a server, using one of the supported protocols (DICT, FILE, FTP, FTPS, GOPHER, HTTP, HTTPS,
       IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMB, SMBS, SMTP, SMTPS, TELNET and TFTP). The command is designed to work
       without user interaction.

       curl  offers  a busload of useful tricks like proxy support, user authentication, FTP upload, HTTP post, SSL connections, cookies, file
       transfer resume, Metalink, and more. As you will see below, the number of features will make your head spin!

       curl is powered by libcurl for all transfer-related features. See libcurl(3) for details.
...
```


## CLI

{% include cli.html cli=page.cli %}


## Files

Provide a path to a file.

### Basic upload

```sh
curl -F 'upload=@my_file.txt' URL
```

### Image

```sh
curl -F 'image=@my_image.png' URL
```

## Headers

Protocol response headers.

### Head

Using `-I` flag, _only_ the headers will be shown. No content.

This can be useful for debugging an API or a server-rendered page, where you don't get about the content (which can be long).

e.g.

```console
$ curl -I https://google.com
HTTP/2 301
location: https://www.google.com/
content-type: text/html; charset=UTF-8
date: Sat, 21 Aug 2021 12:24:24 GMT
expires: Mon, 20 Sep 2021 12:24:24 GMT
cache-control: public, max-age=2592000
server: gws
content-length: 220
x-xss-protection: 0
x-frame-options: SAMEORIGIN
alt-svc: h3=":443"; ma=2592000,h3-29=":443"; ma=2592000,h3-T051=":443"; ma=2592000,h3-Q050=":443"; ma=2592000,h3-Q046=":443"; ma=2592000,h3-Q043=":443"; ma=2592000,quic=":443"; ma=2592000; v="46,43"
```

### Add headers

Using `-i` flag, you'll see the headers added like date and content type.

Any other content like HTMl will be shown after it.

e.g.

```console
$ curl -i https://google.com
location: https://www.google.com/
content-type: text/html; charset=UTF-8
date: Sat, 21 Aug 2021 12:22:33 GMT
expires: Mon, 20 Sep 2021 12:22:33 GMT
cache-control: public, max-age=2592000
server: gws
content-length: 220
x-xss-protection: 0
x-frame-options: SAMEORIGIN
alt-svc: h3=":443"; ma=2592000,h3-29=":443"; ma=2592000,h3-T051=":443"; ma=2592000,h3-Q050=":443"; ma=2592000,h3-Q046=":443"; ma=2592000,h3-Q043=":443"; ma=2592000,quic=":443"; ma=2592000; v="46,43"

<HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
<TITLE>301 Moved</TITLE></HEAD><BODY>
<H1>301 Moved</H1>
The document has moved
<A HREF="https://www.google.com/">here</A>.
</BODY></HTML>
```
