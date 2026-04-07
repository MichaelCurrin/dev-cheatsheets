# Time zone support

## UTC

If you just need UTC time, use the builtin from Python 3.2 as `datetime.timezone.utc`.

```python
from datetime import datetime, timezone

now = datetime.now(timezone.utc)
```

## Use Zoneinfo for other time zones

Since Python 3.9, you don't need to rely on the 3rd-party package `pytz`.

Use the builtin `zoneinfo`.

See [docs](https://docs.python.org/3/library/zoneinfo.html)

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
