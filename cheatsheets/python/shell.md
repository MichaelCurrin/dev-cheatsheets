---
title: Python shell
description: Running shell commands through Python
---

Read more in [Python shell](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/Python/shell) guide.

```python
result = subprocess.run(cmd, capture_output=True, text=True, shell=True)
```


```python
exitcode, data = subprocess.getstatusoutput(cmd)
```
