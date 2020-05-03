# Time handling cheatsheet


## Resources

- [unixtimestamp.com](https://www.unixtimestamp.com/) converter.
- [Unix time](https://en.wikipedia.org/wiki/Unix_time) on Wikipedia.
- [ISO 8061](https://en.wikipedia.org/wiki/ISO_8601)


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

## Convert from ISO 8061

The Twitter API often provides a datetime value in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format and Tweepy returns this to you as a string still.

e.g. `"2020-05-03T18:01:41+00:00"`.

This section covers how to parse a datetime string to a timezone-aware datetime object, to make it more useful for calculations and representations.

```python
import datetime


TIME_FORMAT_IN = r"%Y-%m-%dT%H:%M%z"


def parse_datetime(value):
    """
    Convert from Twitter datetime string to a datetime object.

    >>> parse_datetime("2020-01-24T08:37:37+00:00")
    datetime.datetime(2020, 1, 24, 8, 37, tzinfo=datetime.timezone.utc)
    """
    dt = ":".join(value.split(":", 2)[:2])
    tz = value[-6:]
    clean_value = f"{dt}{tz}"

    return datetime.datetime.strptime(clean_value, TIME_FORMAT_IN)
```
