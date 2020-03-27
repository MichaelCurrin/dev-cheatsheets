# Base64

- [Base64 on Wikipedia](https://en.wikipedia.org/wiki/Base64)
- [Base32 on Wikipedia](https://en.wikipedia.org/wiki/Base32)


## Index table

Values 0 to 61 are:

- A–Z
- a–z
- 0–9

Then the last two values can change but typically `+` and `/`.

Padding character: `=`.


## Shell command

- [base64](https://linux.die.net/man/1/base64) Linux man page.

Use `base64` and `-d` or `--decode` to decode.

Encode:

```sh
$ echo  'Hello, world!' | base64
SGVsbG8sIHdvcmxkIQo=
```

Decode:

```sh
$ echo 'SGVsbG8sIHdvcmxkIQo=' | base64 -d
Hello, world!
```
