# Base64 encoding

- [Base64 on Wikipedia](https://en.wikipedia.org/wiki/Base64)
- [Base32 on Wikipedia](https://en.wikipedia.org/wiki/Base32)


## Index table

Values 0 to 61 are the following, in order:

- `A` – `Z`
- `a` – `z`
- `0` – `9`

Then the last two values can change but typically `+` and `/`.

Padding character: `=`.

## Usage

### JavaScript

Use the built-in functions `btoa` and `atob`. No imports are needed.

Note `b` is `binary` and **not** base-64.

From [Mozilla docs](https://developer.mozilla.org/en-US/docs/Glossary/Base64):

> In JavaScript there are two functions respectively for decoding and encoding base64 strings:
>
> - `btoa()`: creates a base-64 encoded ASCII string from a "string" of binary data ("btoa" should be read as "binary to ASCII").
> - `atob()`: decodes a base-64 encoded string ("atob" should be read as "ASCII to binary").

### Encode

Convert from binary string to base-64 ASCII string.

```javascript
> btoa("Hello, world!")
"SGVsbG8sIHdvcmxk"
```

### Decode

```javascript
> atob("SGVsbG8sIHdvcmxk")
"Hello, world!"
```

## Python

Guide for Python 3.

Use the built-in `base64` library.

### Import

```python
>>> import base64
```

### Encode

```python
>>> base64.b64encode("Hello, world!".encode())
b'SGVsbG8sIHdvcmxkIQ=='
```

Always convert to `bytes` first using `str.encode`. Otherwise you get an error (in both PY 2 and 3).

As `bytes` means any special characters like accents or emojis will be ASCII.

For ordinary ASCII characters, the `bytes` will look the same:

```python
>>> "Hello, world!".encode()
b'Hello, world!'
```

### Decode

Bytes input.

```python
>>> base64.b64decode(b'SGVsbG8sIHdvcmxkIQ==')
b'Hello, world!'
```

Or (unicode) string input.

```python
>>> base64.b64decode('SGVsbG8sIHdvcmxkIQ==')
b'Hello, world!'
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
