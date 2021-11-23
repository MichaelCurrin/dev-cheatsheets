# Code

## Enviroment variables

```typescript
const env = Deno.env.toObject()
const PORT = env.PORT || 4000
const HOST = env.HOST || '127.0.0.1'
```


## Browser vs CLI

From [1.7](https://deno.land/posts/v1.7) release notes.

> Use `typeof Deno !== "undefined"` to determine if you are running in Deno, 

> and use `typeof document !== "undefined" `to determine if the DOM is available or not.
