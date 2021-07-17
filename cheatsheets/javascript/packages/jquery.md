# jQuery

## Ajax

```javascript
const params = { 
  url: URL, 
  crossDomain: true 
};

$.ajax(params)
  .then(result => console.log(result));
```


## Get JSON

```javascript
const params = {
  url: URL,
  headers: {
    "accept": "application/json",
    "Access-Control-Allow-Origin": "*"
  }
};

$.getJSON(params)
  .then(result => console.log(result));
```
