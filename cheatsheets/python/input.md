---
title: Input
description: Get input from a user in a terminal app
---


## Text

After `input()`, then Python waits for the user to enter input and press <kbd>Enter</kbd>, or to cancel with <kbd>Ctrl</kbd>+<kbd>D</kbd>.

On macOS and Linux, this seems to use the `readline` shell command internally.


### Help

From `help(input)`:

```
Help on built-in function input in module builtins:

input(prompt=None, /)
    Read a string from standard input.  The trailing newline is stripped.
    
    The prompt string, if given, is printed to standard output without a
    trailing newline before reading input.
    
    If the user hits EOF (*nix: Ctrl-D, Windows: Ctrl-Z+Return), raise EOFError.
    On *nix systems, readline is used if available.
```

### Examples

Example in the console:

```python
>> answer = input()
Hello, World

>>> answer
'Hello, World'
```

Or as a script:

```python
answer = input()
print(answer)
```

Example with a prompt. Note the space after the prompt text.

```python
>>> answer = input("What is your age? ")
What is your age? 31
>>> answer
"31"
>>> int(answer)
31
```

Put the question and answer on different lines using `\n` and tell the user to enter input with `>` symbol.

```
>>> input("What is your age?\n> ")
What is your age? 
> 31
'31'
```

Here is a REPL. It runs in a loop, handling user input and printing repeatedly.

```python
print("Square tool")

while True:
  answer = input("Enter a number:\n> ")
  squared = int(answer) ** 2
  print(f"Squared: {squared}\n")
```

Running it:

```sh
$ python3 app.py
Enter a number:
> 2
Squared: 4

Enter a number:
> 4
Squared: 16
```

### Deprecation note

Note that previously there was both and `input` and `raw_input`. Using `input` would evaluate input as Python code using something like `eval` internally. This turned for example numeric input from a string to an integer.

Now there is just `input`. This is safe and will _not_ run an evaluation as Python code.


## Get password

Get the user to enter a password in the console.

The characters will be masked as invisible.

### Usage

```python
getpass.getpass()

getpass.getpass(prompt=CUSTOM_PROMPT, stream=OUTPUT_STREAM) 
```

e.g.

```python
import getpass

pword = getpass.getpass() 
# Password: 

pword
# 'my password'
```

In Unix, this uses this function:

```console
>>> help(getpass.getpass)
unix_getpass(prompt='Password: ', stream=None)
    Prompt for a password, with echo turned off.
    
    Args:
      prompt: Written on stream to ask for the input.  Default: 'Password: '
      stream: A writable file object to display the prompt.  Defaults to
              the tty.  If no tty is available defaults to sys.stderr.
    ...
```

### Examples

```python
import getpass 
  
  
try: 
    p = getpass.getpass() 
except Exception as error: 
    print('ERROR', error) 
else: 
    print('Password entered:', p) 
```

Run it.

```sh
$ python3 app.py
Password: ****
Password entered: abcd
```
