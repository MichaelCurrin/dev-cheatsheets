# How to request

## Warning on security

Please do _not_ put your private token in any public code on GitHub or hardcoded in any code at call. Also, do _not_ use the token on your frontend JS code, as someone can easily copy the token from your code or from the inspected request, then can abuse your token and stop it from working (or worse, change data).

Rather have requests on a frontend be unauthenticated. Or add a flow for the user to sign in with OAuth and then you use their token. Or put your request away from the frontend, like on a Python or Node server or on a serveless function like AWS Lambda or Netlify Function, so the browser hits a page or an endpoint which runs your request with the auth token internally and returns the finished result.


## Browser

Endpoint used here for testing:

- [https://api.github.com/repos/octokit/core.js/releases/latest](https://api.github.com/repos/octokit/core.js/releases/latest)


## Shell using cURL

No authentication. This works fine for a lot of read requests.

```sh
$ curl https://api.github.com/repos/octokit/core.js/releases/latest
```

Using an auth token - to reduce rate limiting, get private data, and to update data.

```sh
$ curl https://api.github.com/repos/octokit/core.js/releases/latest \
  --header "Authorization: token MY_TOKEN"
```


## JavaScript

No auth - this code is safe for the backend and frontend.

```javascript
const url = "https://api.github.com/repos/octokit/core.js/releases/latest"

const resp = await fetch(url)  
const respData = await resp.json()
```

With auth - note that `process` object is only available in the backend on Node and not in the frontend, which is fine as you should _not_ be exposing your token on the frontend anyway.

```javascript
const TOKEN = process.env.TOKEN ?? ''

const url = "https://api.github.com/repos/octokit/core.js/releases/latest"
const options = {
  headers: {
    authorization: "token ${TOKEN}"
  }
}

const resp = await fetch(url, options)  
const respData = await resp.json()
```

I have a site which does something similar and adds the response to the page here, using Vue:

- [https://michaelcurrin.github.io/gist-viewer](https://michaelcurrin.github.io/gist-viewer)
- [Gists.js](https://github.com/MichaelCurrin/gist-viewer/blob/master/assets/js/Gists.js)
