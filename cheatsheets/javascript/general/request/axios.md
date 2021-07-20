# Axios

- [Homepage](https://axios-http.com)
- [Repo](https://github.com/axios/axios)


## Install

```sh
$ npm install axios
```


## Import

```javascript
import axios from "axios";
```


## Usage

### Async

```javascript
try {
  const resp = await axios.get(url);
  console.log(resp);
} catch(err) {
  console.error(err);
}
```

In an async function.

```javascript
async function getUser() {
  try {
    const resp = await axios.get('/user?ID=12345');
    console.log(resp);
  } catch(err) {
    console.error(err);
  }
}
```

### Promises

```javscript
axios.get('/users')
  .then(resp => {
    console.log(resp.data);
  });
```

### Params

```javascript
axios.get('/user?ID=12345')

// OR
const params = {
  ID: 12345
}
axios.get('/user', { params })
```

### POST reqeuest

```javascript
axios.post('/user', {
    firstName: 'Fred',
    lastName: 'Flintstone'
})
```

More advanced. Note Axios includes automatic JSON and form-encoded serialization and parsing.

```javascript
const query = new URLSearchParams(query).toString();
const url = '/myendpoint'

const options = {
  params: query, 
  body
};

const resp = await axios.post(
  url, 
  options
);
```

### Concurrent requests

```javascript
function getUserAccount() {
  return axios.get('/user/12345');
}

function getUserPermissions() {
  return axios.get('/user/12345/permissions');
}

const requests = [getUserAccount(), getUserPermissions()]

Promise.all(requests)
  .then(function (results) {
    const [account, permissions] = results;
    
    // OR
    const account = results[0];
    const permissions = results[1];
  });
```
