# Callback function

```javascript
foo('bar', function (bazz) {
  console.log(bazz.toUpperCase());
});
```

This is the infamous "callback hell" where you have to nest function calls to chain them. This what the only way for a long time.

```javascript
foo('bar', function (bazz) {
  fizz(bazz, function(boo) {
    console.log(boo.toUpperCase());
  }
});
```
