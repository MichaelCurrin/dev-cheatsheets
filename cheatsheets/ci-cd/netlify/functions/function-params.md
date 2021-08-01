# Function params

## Event only

```javascript
exports.handler = function (event) {
  return {
    statusCode: 200,
    body: "Hello, World!",
  }
}
```


## Context

```javascript
exports.handler = function (event) {
  return {
    statusCode: 200,
    body: "Hello, World! ${JSON.stringify(context)}",
  }
}
```


## Callback

```javascript
exports.handler =  unction (event, context, callback) {
  callback(null, {
    statusCode: 200,
    body: "Hello, World!"
  })
}
```
