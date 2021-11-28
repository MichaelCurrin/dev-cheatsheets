---
title: Lines
description: Iterate over lines in a file
---

e.g.

```sh
for ROW in $(< requirements.txt); do
  echo "pip install $ROW"
done
```

From `xargs` manpage:

> The xargs utility reads space, tab, newline and end-of-file delimited strings from the standard input and executes utility with the strings as arguments.

```sh
cat requirements.txt | xargs pip install
```
