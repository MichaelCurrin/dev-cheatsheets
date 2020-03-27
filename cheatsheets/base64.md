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

## Usage

### JavaScript

Use the builtin functions `btoa` and `atob`.

From [Mozilla docs](https://developer.mozilla.org/en-US/docs/Glossary/Base64):

> In JavaScript there are two functions respectively for decoding and encoding base64 strings:
>
> - btoa(): creates a base-64 encoded ASCII string from a "string" of binary data ("btoa" should be read as "binary to ASCII").
>  - atob(): decodes a base64 encoded string("atob" should be read as "ASCII to binary").


Encode:

```javascript
> btoa("Hello, world!")
"SGVsbG8sIHdvcmxk"
```

Decode:

```javascript
> atob("SGVsbG8sIHdvcmxk")
"Hello, world!"
```


### Shell

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
