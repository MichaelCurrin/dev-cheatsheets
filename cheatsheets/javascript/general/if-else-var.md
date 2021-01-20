# if-else variable


## Ternary

Use a single line to define a variable using `if-else` logic. 

```javascript
var x = 0
var y = 10

var answer = x ? "yes" || "no"
answer = y ? "yes" : "no"
// "yes"
```

This syntax is the same as in C.

In Python:

```python
x = 0
y = 10

answer = "yes" if x else "no"
# "no"
answer = "yes" if y else "no"
# "yes"
```


## AND OR

You can use `&&` and `||` operators for the same effect as above, though it is is less readable.

```javascript
var x = 0
var y = 10

var answer = x && "yes" || "no"
// "no"
answer = y && "yes" || "no"
// "yes"
```

You'll find the same thing in shell programming.

```
./script.sh && echo 'Success' || echo 'Failed'
```


## OR

Use the logical OR operation (`||`) to use a default value if the value (like a boolean, string or number) is a null value.

```javascript
var x = 0
x = x || 123
// 123

var y = 10
y = y || 123
// 10
```

Some languages like Ruby let you do this in a shorter expression:

```ruby
x ||= 123
# i.e.
x = x || 123
```
