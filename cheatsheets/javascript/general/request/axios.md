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

### POST

```javascript
axios.post('/user', {
    firstName: 'Fred',
    lastName: 'Flintstone'
})
```

### Concurrent requests

```javascript
function getUserAccount() {
  return axios.get('/user/12345');
}

function getUserPermissions() {
  return axios.get('/user/12345/permissions');
}

Promise.all([getUserAccount(), getUserPermissions()])
  .then(function (results) {
    const acct = results[0];
    const perm = results[1];
  });
```
