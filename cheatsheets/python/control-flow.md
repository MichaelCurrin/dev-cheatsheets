# Control flow

### `if`, `elif`, `else` - Conditional Execution

```python
if condition1:
    # code to execute if condition1 is true
elif condition2:
    # code to execute if condition2 is true (and condition1 was false)
else:
    # code to execute if all preceding conditions are false
```

### `for` loop with `else` - Iteration with Completion Check

Iterates over a sequence (like a list, tuple, string, or range). The `else` block is executed *only if* the loop completes without encountering a `break` statement.

**Syntax:**

```python
for item in iterable:
    # code to execute for each item
    # if condition_to_break:
    #     break  # Exits the loop and skips the else block
else:
    # code to execute if the loop completes normally (without a 'break')
```


###  `while` loop - Repetitive Execution

```python
while condition:
    # code to execute repeatedly as long as condition is true
    # Make sure to break or make the condition false to avoid an infinite loop
```

### 4`match` statement (Python 3.10+) - Structural Pattern Matching

Allows you to compare a value (the "subject") against several possible patterns. It's a more powerful and readable alternative to multiple `elif` statements for specific comparison scenarios.

```python
match subject:
    case pattern1:
        # code to execute if subject matches pattern1
    case pattern2:
        # code to execute if subject matches pattern2
    case _:  # The "wildcard" pattern, similar to 'else'
        # code to execute if no other pattern matches
```

e.g.
```python
status_code = 200

match status_code:
    case 200:
        print("Foo: Success (OK)")
    case 404:
        print("Bar: Not Found")
    case 500:
        print("Baz: Internal Server Error")
    case _: 
        print("Unknown status code")
```

```python
day = 4

match day:
  case 1:
    print("Monday")
  case 2:
    print("Tuesday")
  case 3:
    print("Wednesday")
  case 4:
    print("Thursday")
  case 5:
    print("Friday")
  case 6:
    print("Saturday")
  case 7:
    print("Sunday")
```

Using an expression:

```python
day = 4

match day:
  case 1 | 2 | 3 | 4 | 5:
    print("Today is a weekday")
  case 6 | 7:
    print("I love weekends!")
```

```python
month = 5
day = 4

match day:
  case 1 | 2 | 3 | 4 | 5 if month == 4:
    print("A weekday in April")
  case 1 | 2 | 3 | 4 | 5 if month == 5:
    print("A weekday in May")
  case _:
    print("No match")
```
