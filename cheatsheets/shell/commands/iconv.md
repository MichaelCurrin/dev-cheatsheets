# iconv

```
NAME
       iconv - character set conversion

SYNOPSIS
       iconv [OPTION...] [-f encoding] [-t encoding] [inputfile ...]
       iconv -l
...
```

## Handle unicode

### Unicode escaped characters

```sh
$ echo 'foo \u003e \u00cd baz' | iconv -f utf-8
foo > Í baz
```

### Emojis

Note that emojis cannot be described in unicode but can as ASCII.

```sh
$ echo 'Hello \xf0\x9f\x98\x80!' | iconv -f utf-8
Hello 😀!
```


## Standard

Plain `echo` with neat values.

```sh
$ echo 'foo > Í 😀 baz'
foo > Í 😀 baz
```
