# Function params

## Event only

```javascript
function handler(event) {
  return {
    statusCode: 200,
    body: "Hello, World!",
  }
}

exports.handler = handler
```


## Context and callback

```javascript
function handler (event, context, callback) {
  callback(null, {
    statusCode: 200,
    body: "Hello, World!"
  })
}
```
