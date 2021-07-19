# Object shorthand

```javascript
const x = 123

const y = {
  x
}

y
// { x: 123 }
```

That is the equivalent of setting:

```javascript
const y = {
  x: x
}
```
