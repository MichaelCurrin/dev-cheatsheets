# Time handling cheatsheet


## Current time


```python
time.time()
# => 1588530495.7379987
```

```python
datetime.datetime.today()
# => datetime.datetime(2020, 5, 3, 20, 26, 31, 4754)
```

### Time zone aware

This accepts option `tzinfo` value. See `pytz` library.

```python
datetime.datetimen.now()
# => datetime.datetime(2020, 5, 3, 20, 26, 27, 20361)
```


## Get current date

```python
datetime.date.now()
# => datetime.date(2020, 5, 3)
```


## Get date from datetime

```python
d = datetime.datetime.now()
d.date()
# => datetime.date(2020, 5, 3)
```


## Convert from unixtimestamp

```python
datetime.datetime.fromtimestamp(1403602426.0)
# => datetime.datetime(2014, 6, 24, 11, 33, 46)
```
Must be an integer or float - a string will give an error.

