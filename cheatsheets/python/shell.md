---
description: Run shell commands using Python
---
# Shell


A shell command will run in a subprocess within the Python process.


## Resources

- [subprocess](https://docs.python.org/3/library/subprocess.html) module in the docs
- [Python shell](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/Python/shell) guide in Learn to Code.


## Import

```python
import subprocess
```


## Run

```python
cmd = "MY_COMMAND"

result = subprocess.run(
    cmd, 
    capture_output=True, 
    text=True, 
    shell=True
)
```


## Capture output

```python
output = subprocess.getstatusoutput(cmd)
```

Output will be a string.

e.g.

```python
cmd = "git remote get-url origin"

subprocess.getstatusoutput(cmd)
# 'git@github.com:MichaelCurrin/shell-dev-setup.git'
```


## Capture output and status code

```python
exitcode, output = subprocess.getstatusoutput(cmd)
```

Exitcode will be an integer.

Output will be a string.

e.g.

```python
cmd = "ls -l"
exitcode, output = subprocess.getstatusoutput(cmd)

exitcode
# 0

print(output)
# total 36
# drwxrwxr-x 5 michael michael 4096 Oct 16 21:14 bin
# drwxrwxr-x 4 michael michael 4096 Oct 16 21:14 configs
# ...
```
