---
title: grep
---

### Usage

```
grep [OPTIONS] PATTERN [FILE...]
grep [OPTIONS] [-e PATTERN | -f FILE] [FILE...]
```

### Quick view


| Use Case | Command Example |
| :--- | :--- |
| **Basic Search** | `grep "PATTERN" FILENAME` |
| **Case-Insensitive Search** | `grep -i "PATTERN" FILENAME` |
| **Count Matches** | `grep -c "PATTERN" FILENAME` |
| **Display Line Numbers** | `grep -n "PATTERN" FILENAME` |
| **Invert Match** | `grep -v "PATTERN" FILENAME` |
| **Recursive Search** | `grep -r "PATTERN" DIRECTORY` |
| **Show Context** | `grep -C NUM "PATTERN" FILENAME` |
| **Extended Regex** | `grep -E "REGEX_PATTERN" FILENAME` |
| **Piping** | `command \| grep "PATTERN"` |
