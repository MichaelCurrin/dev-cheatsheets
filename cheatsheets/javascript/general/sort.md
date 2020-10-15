# Sort

## Text

```javascript
var foo = ['b', 'a', 'c', 'A'];
foo.sort();

foo.reverse();
```

## Numeric

```javascript
var points = [40, 100, 1, 5, 25, 10];
// Ascending.
points.sort(function (a, b) {return a - b});
// Descending.
points.sort(function(a, b){return b - a});
// Random order.
points.sort(function(a, b){return 0.5 - Math.random()});
```
