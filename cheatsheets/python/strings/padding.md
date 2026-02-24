# Padding

## Using str.zfill()

```python
num = 42
str(num).zfill(5)
#00042
```

## Using format

```python
num = 42
f"{num:05d}" # or "{:05d}".format(num)
# 00042
```

## Using rjust() for strings

```python
num = 42
str(num).rjust(5, '0')
# 00042
```
