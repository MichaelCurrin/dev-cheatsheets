# Date

Use the `date` command for the current time and format as date and time.

```makefile
BUILD_DATE = $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")
```
