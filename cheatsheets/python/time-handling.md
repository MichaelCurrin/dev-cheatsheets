# Time handling


## Resources

- [datetime](https://docs.python.org/3/library/datetime.html) module in Python.
- [strftime](https://strftime.org/) cheatsheet
- [unixtimestamp.com](https://www.unixtimestamp.com/) converter.
- [Unix time](https://en.wikipedia.org/wiki/Unix_time) on Wikipedia.
- [ISO 8061](https://en.wikipedia.org/wiki/ISO_8601)


## Date and time

### Today

Get a `date` object.

```python
datetime.date.today()
# => datetime.date(2021, 5, 8)
```

### Now

Get a float.

```python
time.time()
# => 1620464710.3691561
```

Get a `datetime` object. Both `today` and `now` give the same result, but only `now` can accept a [time zone](#time-zone).

```python
datetime.datetime.today()
# => datetime.datetime(2021, 5, 8, 11, 4, 58, 331706)

datetime.datetime.now()
# => datetime.datetime(2021, 5, 8, 11, 9, 39, 197198)
```


## Create

### Date

```python
x= datetime.date(2021, 1, 2)
# datetime.date(2021, 1, 2)
str(x)
# '2021-01-02'
```

### Datetime

Create a datetime from a date - defaults to midnight.

```python
datetime.datetime(2021, 1, 2)
# datetime.datetime(2021, 1, 2, 0, 0)
str(datetime.datetime(2021, 1, 2))
'2021-01-02 00:00:00'
```

Create a datetime.

```python
x = datetime.datetime(2021, 1, 2, 3, 40)
# datetime.datetime(2021, 1, 2, 3, 40)
str(x)
# '2021-01-02 03:40:00'
```

If you want to be more explicit:

```python
datetime.datetime(year=2021, month=1, day=2)
# datetime.datetime(2021, 1, 2, 0, 0)
```


## Attributes

```python
datetime.datetime.ATTRIBUTE
```

e.g.

```python
n = datetime.datetime.now()

n.hour
# 11

n.year
# 2021

n.month
# 5

n.day
# 8

n.hour
# 11

n.minute
# 30

n.second
# 51
```


## Format

### Format codes

- [strftime() and strptime() Format Codes](https://docs.python.org/3/library/datetime.html#strftime-and-strptime-format-codes)

Some useful combinations:

- 12-hour time
    ```
    %I:%M %p
    11:01 AM
    11:01 PM
    ```
- 24-hour time
    ```
    %H:%M:%Ss
    11:01:01s
    23:01:01s
    ```
- Time zone.
    ```
    %z
    +0000
    -0400
    ```
- Long day.
    ```
    %A, %-d %B %Y
    Sunday, 1 January 2021
    ```
- Short day.
    ```
    %Y-%M-%d
    2021-01-01
    ```

### String to datetime

Convert from date or datetime object to a sring.

Using `.strftime` where  the `f` is for "format". 

Supply a custom format.

```python
MY_DATETIME.strftime(MY_FORMAT)
```

e.g.

```python
n = datetime.datetime.now()
# datetime.datetime(2021, 5, 8, 11, 30, 51, 733268)
```

Standard:

```python
str(n)
'2021-05-08 11:30:51.733268'
```

Custom:

```python
n.strftime('%Y_%m_%d - %b %y - %H:%m:%S')
'2021_05_08 - May 21 - 11:05:51'
```

## String to datetime

Parse from a string to datetime object. 

Using `strptime`, where the `p` stands for "parse".

```python
datetime.datetime.strptime(DATETIME_STRING, CUSTOM_FORMAT)
```

e.g.

Set the time.

```python
dt = datetime.datetime.strptime("21/11/06 16:30", "%d/%m/%y %H:%M")
# datetime.datetime(2006, 11, 21, 16, 30)
str(dt)
# '2006-11-21 16:30:00'
```

Omit time and it will be midnight.

```python
dt = datetime.datetime.strptime('2021-01-02', '%Y-%m-%d')
# datetime.datetime(2021, 1, 2, 0, 0)
str(dt)
# '2021-01-02 00:00:00'

dt = datetime.datetime.strptime('12/05/19', '%m/%d/%y')
# datetime.datetime(2019, 12, 5, 0, 0)
str(dt)
'2019-12-05 00:00:00'
```

There is no `strptime` method on `datetime.date`, but you can convert a datetime to date. See the next section.


## Conversion

Move between date formats.

### Convert from date from datetime

```python
dt = datetime.datetime.now()
d = dt.date()
# datetime.date(2020, 5, 3)
```

```python
dt = datetime.datetime.strptime('12/05/19', '%m/%d/%y')
d = dt.date()
# datetime.date(2019, 12, 5)
str(d)
'2019-12-05'
```


### Convert from unix timestamp to datetime

```python
datetime.datetime.fromtimestamp(1403602426.0)
# datetime.datetime(2014, 6, 24, 11, 33, 46)
```

The input be an integer or float.

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

### Unix timestamp to date and time

Convert duration in seconds to equivalent value in days, hours, minutes or seconds. Using maths and without using `datetime`.

```python
duration = 1234

d = duration / (24 * 60 * 60)
h = duration / (60 * 60) % 24
m = duration / 60 % 60
s = duration % 60
d, h, m, s
# (0.014282407407407407, 0.3427777777777778, 20.566666666666666, 34)
```


## Timedelta
> Or time difference or duration

You can add and subtract date or datetime objects from each other.

### How many days

Get timedelta in days between two dates.

```python
datetime.date(2021, 1, 5) - datetime.date(2021, 1, 1)
# datetime.timedelta(days=4)
```

### Difference in seconds

```python
x = datetime.datetime.now()
y = datetime.datetime.now()

y - x
# datetime.timedelta(seconds=2, microseconds=693039)

x - y
# datetime.timedelta(days=-1, seconds=86397, microseconds=306961)
```

### Find difference between a timestamp and now

Lets say you want to get age.

```python
x = datetime.date.today() - datetime.date(1990, 1, 2)
# datetime.timedelta(days=11449)

x.days
# 11449

# Appromiate age in years.
round(x.days / 365.25, 2)
# 31.35

x.total_seconds()
989193600.0
```

In one line from the CLI:

```sh
$ python3 -c 'import datetime; print( round( ( datetime.date.today() - datetime.date(1989, 6, 3) ).days / 365.25, 2 ) )'
31.93
```

### Future time

Let's say you want something to expire in 30 minutes from now and you want to know when that is.

```python
n = datetime.datetime.now()
str(n)
# '2021-05-08 11:30:51.733268'

expire_at = n + datetime.timedelta(minutes=30)
str(expire_at)
# '2021-05-08 12:00:51.733268'
```

You can be more precise with hours, minutes and seconds.

```python
d = datetime.timedelta(hours=1, minutes=2, seconds=3)
# datetime.timedelta(seconds=3723)

str(d)
'1:02:03'
```

Or with days.

```python
d = datetime.timedelta(days=1000,seconds=10)
# datetime.timedelta(days=1000, seconds=10)

str(d)
# '1000 days, 0:00:10'
```


## Time zone

You can also set a time zone with a `tzinfo` object. See  the [pytz](https://pypi.org/project/pytz/) library, which can be installed a package.

> The preferred way of dealing with times is to always work in UTC, converting to localtime only when generating output to be read by humans.

```python
import pytz

datetime.datetime(2002, 10, 27, 6, 0, 0, tzinfo=pytz.utc)

datetime.datetime.now(tzinfo=pytz.utc)
```
