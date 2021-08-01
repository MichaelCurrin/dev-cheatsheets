# Event

Fields on the `event` object.

- `event.path` - the request path. e.g. `/.netlify/functions/abc/abc.js`.
- `event.httpMethod` the request HTTP method e.g. `"GET"`.
- `event.headers` the request headers
- `event.queryStringParameters` - the request query parameters. e.g. `?a=b&d=123` as `{ a: "b", d: 123 }`.
- `event.body` the request body in JSON format. Such as if receiving data on a POST.
