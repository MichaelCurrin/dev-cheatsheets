# setInterval

Repeat a function call at given interval.

It's like using `setTimer` on an indefinite loop.

- [setInterval](https://developer.mozilla.org/en-US/docs/Web/API/setInterval) on MDN.


## Syntax

```javascript
setInterval(function, milliseconds, param1, param2, ...)
```

Or from MDN:

```javascript
var intervalID = setInterval(func, [delay, arg1, arg2, ...]);
var intervalID = setInterval(function[, delay]);
var intervalID = setInterval(code, [delay]);
```


## Cancel

```javascript
cancelTimer(intervalID)
```


## Example

```javascript
function myCallback(a, b) {
 console.log(a);
 console.log(b);
}

const intervalID = setInterval(myCallback, 500, 'Parameter 1', 'Parameter 2');
```

Start and stop:

```javascript
var timer;

function startTimer() {
    timer = setInterval(function() {
        alert("5 seconds are up");
    }, 5000);
}

function stopTimer() {
    alert("Timer stopped");
    clearInterval(timer);
}
```

An interval that can cancel itself. This can be useful if you want to check until something is done and intervals and then stop checking when it is ready.

```javascript
const timer = setInterval(function() {
  clearInterval(timer);
}, 500);
```
