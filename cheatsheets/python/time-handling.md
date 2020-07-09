---
title: Time handling
---


## Resources

- [unixtimestamp.com](https://www.unixtimestamp.com/) converter.
- [Unix time](https://en.wikipedia.org/wiki/Unix_time) on Wikipedia.
- [ISO 8061](https://en.wikipedia.org/wiki/ISO_8601)


## Date and time


### Current time


```python
time.time()
# => 1588530495.7379987
```

```python
datetime.datetime.today()
# => datetime.datetime(2020, 5, 3, 20, 26, 31, 4754)
```

#### Time zone aware

This accepts option `tzinfo` value. See `pytz` library.

```python
datetime.datetimen.now()
# => datetime.datetime(2020, 5, 3, 20, 26, 27, 20361)
```


### Get current date

```python
datetime.date.now()
# => datetime.date(2020, 5, 3)
```


### Get date from datetime

```python
d = datetime.datetime.now()
d.date()
# => datetime.date(2020, 5, 3)
```

### Convert from unixtimestamp

```python
datetime.datetime.fromtimestamp(1403602426.0)
# => datetime.datetime(2014, 6, 24, 11, 33, 46)
```
Must be an integer or float - a string will give an error.

#### With hours offset

There may be a cleaner way to do this in the `datetime` library.

```python
def my_time(unix_time, hours_diff=0):
    """
    Change unix timestamp in seconds into datetime format, with optional
    time difference hours specified.

    Usecase: receive timestamp from API and return as datetime object
        which has properties
            year, month, day, hour, minute, second
    Args
        unix_time: unix timestamp in seconds
        hours_diff: <type 'int'> e.g. -2, or 6
            numbers of hours to add or subtract.
    Returns
        datetime object.
            Shows in format '2016-12-11 15:40:00' if printed
    """
    unix_time_diff = hours_diff * 60 * 60  # hours * min * seconds
    in_time = unix_time + unix_time_diff

    return datetime.datetime.fromtimestamp(in_time)
```


### Convert from ISO 8061

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


## Timedelta
> Or time difference or duration

### Find difference between a timestamp and now

```python
def get_duration(duration, initial_time=None):
    """
    Usecase:
        a timestamp is provided as when an access token expires,
         then add it to the current time, then showing it as a human-readable
         future time.
         Alternatively specify a *initial_time* as manual now value.

    Args
        duration: <type 'int'> OR <type 'str'> Duration in seconds.
            If given as a string, convert to int.
        initial_time: <type 'int'> OR <type 'str'> Time to start differenc
            calculation from. If given as a string, convert to int.
            If not set, use current time.
    Returns
        datetime object
            What time will it be after number seconds in have elapsed.
            Shows in format '2016-12-11 15:40:00' if printed.
    """
    duration = int(duration)

    if initial_time:
        initial_time = int(initial_time)
    else:
        initial_time = time.time()

    in_time = initial_time + duration

    return datetime.datetime.fromtimestamp(in_time)
```

### Unix timestamp to date and time

There might be a cleaner way to do this in the `datetime` library.
```python
def unix_to_datetime(duration):
    """
    Convert duration (in unix_timestamp seconds) to days, hours, minutes and
        seconds.
    Args
        duration: <type 'int'> OR <type 'str'> Duration in seconds.
            If given as a string, convert to integer.
    Returns
        d: days [0+]
        h: hours [0-23]
        m: minute [0-59]
        s: seconds [0-59]
    """
    duration = int(duration)

    d = duration / (24 * 60 * 60)
    h = duration / (60 * 60) % 24
    m = duration / 60 % 60
    s = duration % 60

    return d, h, m, s
```
