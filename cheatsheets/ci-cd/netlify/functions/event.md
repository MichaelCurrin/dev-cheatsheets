# Event

Fields on the `event` object.

- `event.path`
    - The request path. 
    - e.g. `/.netlify/functions/abc`.
    - e.g. Requesting the ABC function with `/.netlify/functions/abc/def.json`
        ```javascript
        event.path
        // "/.netlify/functions/abc/def.json"
        
        const name = event.path.split("/")[4];
        // "def.json"
        ```
- `event.httpMethod` the request HTTP method e.g. `"GET"`.
- `event.headers` the request headers
- `event.queryStringParameters`
    - The request query parameters. e.g. `/.netlify/functions/abc?a=b&d=123` as `{ a: "b", d: 123 }`. 
    - For URL with `?myParam=foo`, get with 
        ```javascript
        const myParam = event.queryStringParameters.myParam;
        ```
- `event.body` the request body in JSON format. Such as if receiving data on a POST.
