# Style the console log

Supply CSS styling to `console.log`. Note use of `%c`.

## Single style

```javascript
console.log('%cMy red text', 'color: red')
```

## Combine styles

```javascript
console.log('%cMy bold and red text', 'font-weight: bold; color: red')
```

## Split styles

```javascript
console.log('%cMy bold text %cMy red text', 'font-weight: bold', 'color: red')
```

This only seems to work in the browser and not in Node. You'll need come control characters or an NPM package to handle colors in Node.
