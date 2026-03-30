# Time zone support

Since Python 3.9, you don't need to rely on the 3rd-party package `pytz`.

Use the builtin `zoneinfo`.


[docs](https://docs.python.org/3/library/zoneinfo.html)

```python
from zoneinfo import ZoneInfo
import datetime as dt

dt.datetime(2020, 10, 31, 12, tzinfo=ZoneInfo("America/Los_Angeles"))

dt.datetime(2025, 10, 31, 12, tzinfo=ZoneInfo("UTC"))
```
