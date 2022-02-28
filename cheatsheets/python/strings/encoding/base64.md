# Base 64

Use the built-in `base64` library.

## Import

```python
>>> import base64
```

## Encode

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

## Decode

Input as bytes:

```python
>>> base64.b64decode(b'SGVsbG8sIHdvcmxkIQ==')
b'Hello, world!'
```

Input as string:

```python
>>> base64.b64decode('SGVsbG8sIHdvcmxkIQ==')
b'Hello, world!'
```

The result is always bytes. So convert to string:

```python
>>> base64.b64decode('SGVsbG8sIHdvcmxkIQ==').decode('utf-8')
'Hello, world!'
```
