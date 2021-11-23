
# Hex color code


## Convert integer to hex string

```python
>>> hex(12525)
'0x30ed'
```

## Remove prefix

```python
>>> "{:x}".format(12525)
'30ed'
```


## Left-pad with spaces

```python
>>> "{:6x}".format(12525)
'  30ed'
```


## Left-pad with zeroes

```python
"{:06x}".format(12525)
'0030ed'
```


## Use f-strings

```python
>>> color_number = 12525
>>> f"{color_number:06x}"
'0030ed'
```


## Hex to integer

```python
>>> x = 0x30ed
>>> type(x)
<type 'int'>
```

Max for 6-digit hex code.

```python
>> 0xffffff
16777215
```
