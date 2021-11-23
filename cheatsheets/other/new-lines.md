# New lines

- LF, linefeed, `\n`, for Linux and modern macOS.
- CR, carriage return, `\r`, for old macOS.
- EOL, carriage return and linefeed, `\r\n`, for Windows.


See [SO](https://stackoverflow.com/questions/1552749/difference-between-cr-lf-lf-and-cr-line-break-types).

The Windows approach of two characters to represent `\r` and `\n` is most truth to the original typewriter action of going to a new line and then returning to the first character. 

But it is tedious to do both at least when writing code and writing it out.

For example in Python (JS) you could do this to two lines and that is sufficient.

```python
x = 'a\nb'
```

I sometimes see use of `\r` or `\r\n` in code such as from the Twitter API. The carriage return alone goes to the beginning of the line only, effectively _erasing_ everything printed already at the current line and giving weird results. 

So you might want to replace `\r\n` pair with `\n` to get those consistent and then `\r` with `\n` to fix that up. Note that your data has a mix of `\r` and `\r\n`, it is not safe to replace `\r` with either empty string or `\n` because it will break the other cases.
