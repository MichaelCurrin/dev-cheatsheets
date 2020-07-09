---
title: Head and tail commands
---

## Head

Get first 10 lines.

```
head PATH
```

Get first N lines.

```sh
head -n N PATH
```

## Tail

```sh
tail PATH
```

```sh
tail -n PATH
```

Watch file. There is also `-f` but I think `-F` works even if the file does not exist initially.

```sh
tail -F PATH
```

## Head and tail

Get a portion of a file.

```sh
head -n 20 PATH | tail -n 10
```
