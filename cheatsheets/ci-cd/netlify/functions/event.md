# Event

Fields on the `event` object.

- `event.path`
    - The request path. 
    - e.g. `/.netlify/functions/abc`.
    - e.g. `/.netlify/functions/abc/def.json` if you want to extract `def.json` from the URL on the ABC Function.
- `event.httpMethod` the request HTTP method e.g. `"GET"`.
- `event.headers` the request headers
- `event.queryStringParameters`
    - The request query parameters. e.g. `/.netlify/functions/abc?a=b&d=123` as `{ a: "b", d: 123 }`. 
    - For URL with `?myParam=foo`, get with 
        ```javascript
        const myParam = event.queryStringParameters.myParam;
        ```
- `event.body` the request body in JSON format. Such as if receiving data on a POST.
