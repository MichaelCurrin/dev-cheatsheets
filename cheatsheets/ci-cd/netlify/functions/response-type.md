# Response type


## Text

```javascript
exports.handler = function (event) {
  const text= "Hello, World!"
  
  return {
    statusCode: 200,
    body: text,
  }
}
```


## JSON

Convert an object to a JSON-formatted string.

```javascript
exports.handler = function (event) {
    const respData = {
      message: "Hello World"
      eventData: event
    }

    return {
        statusCode: 200,
        body: JSON.stringify(respData)
    };
}
```

