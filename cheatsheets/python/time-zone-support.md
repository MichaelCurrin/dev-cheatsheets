# Time zone support

## UTC

If you just need UTC time, use the builtin from Python 3.2 as `datetime.timezone.utc`.

```python
import datetime as dt

now = dt.datetime.now(datetime.timezone.utc)
# OR
now = dt.datetime.now(datetime.UTC)
```

## Use Zoneinfo for other time zones

Since Python 3.9, you don't need to rely on the 3rd-party package `pytz`.

Use the builtin `zoneinfo`. See [docs](https://docs.python.org/3/library/zoneinfo.html)

```python
import datetime as dt
from zoneinfo import ZoneInfo

dt.datetime(2020, 10, 31, 12, tzinfo=ZoneInfo("America/Los_Angeles"))
dt.datetime(2025, 10, 31, 12, tzinfo=ZoneInfo("UTC"))
```

### Platform-specific warning

- Linux / macOS: Usually, you don't need to do anything. These systems come with an IANA database pre-installed. ZoneInfo will just work out of the box.
- Windows: Windows does not use the IANA database format natively. If you try to use ZoneInfo on a vanilla Windows install, it will raise a ZoneInfoNotFoundError.
- Containers (Docker): Minimal Docker images (like python:3.11-slim or Alpine) often strip out the timezone database to save space. Your code might work on your Mac but crash the moment it hits the cloud.

The safest is to add `tzdata` to your requirements.

Steps to install and upgrade:

```sh
pip install tzdata
```

## Note from Django docs

[Timezones](https://docs.djangoproject.com/en/6.0/topics/i18n/timezones/)

> Even if your website is available in only one time zone, it’s still good practice to store data in UTC in your database. The main reason is daylight saving time (DST). Many countries have a system of DST, where clocks are moved forward in spring and backward in autumn. If you’re working in local time, you’re likely to encounter errors twice a year, when the transitions happen. This probably doesn’t matter for your blog, but it’s a problem if you over bill or under bill your customers by one hour, twice a year, every year. The solution to this problem is to use UTC in the code and use local time only when interacting with end users.



```sh
pip install --upgrade tzdata
```
