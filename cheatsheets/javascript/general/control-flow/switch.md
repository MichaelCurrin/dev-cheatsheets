# Switch

[W3 Schools](https://www.w3schools.com/js/js_switch.asp)

Note use of break, otherwise a matched level _and_ all levels underneath it will be evaluated.

```javascript
const x = 2;

switch(x) {
  case 1:
    console.log('Hello');
    break;
  case 2:
    console.log('Hi');
    break;
  default:
    console.log('Howdy');
}
```

See also `switch` in C.
