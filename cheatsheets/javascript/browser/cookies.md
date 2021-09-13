# Cookies


## About

Cookies can store data up to 4kb - a small amount, unlike Storage.

They can be used for authentication, tracking (which sites you've visited before) and personalization (based on your choices like color theme or GDPR cookie opt-in).

Cookies are sent back forth on all HTTP requests, unlike Storage. This makes the requests larger.


## Related

- [Cookie recipes][] in Code Cookbook.
- [Time handing][] in JavaScript cheatsheet.

[Cookie recipes]: https://michaelcurrin.github.io/code-cookbook/recipes/javascript/browser/cookies.html
[Time handling]: {{ site.baseurl }}{% link cheatsheets/javascript/general/time-handling.md %}


## Types

- Persistent cookie - persists after the browser is closed. Has an expiration date.
- Session cookie - cleared when the browser is closed. Does not have an expiration date.


## Resources

In Mozilla docs.

- [HTTP cookies](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies) 

See also [Storage][] cheatsheet.

[Storage]: {{ site.baseurl }}{% link cheatsheets/javascript/browser/storage.md %}


## Usage

### Get

See existing cookies as a string. You won't see details like path or expiry unless you go to the _Storage_ tab of DevTools.

```javascript
document.cookie
```

e.g.

```
"_octo=GH1.1.621127999.1603358123; tz=Africa%2FJohannesburg; abc=123"
```

Split string into an array.

```javascript
document.cookie.split("; ")
```

You'll then need to split by `=` and find the one you need by key.

Or just check presence of your key, at the risk that your key exists in another cookie's value.

### Set

Set the key and value.

```javascript
document.cookie = "my_key=my_value"
```

If using HTTP headers:

```
Set-Cookie: my_key=my_value`
```

The attributes are case-insensitive. So `Path`, `path`, and `PATH` all work.

### Path sharing

By default, the cookie is set _only_ for the current path, which you can see in DevTools for the stored cookie.

If you set a value for the same cookie name but with different paths, you'll get two different cookies set.

So you probably want to set the cookie to be on the root like `/`, or maybe some protected area like `/app/`.

e.g.

```javascript
document.cookie = "abc=def 123; Path=/;"
```


## Site sharing

- [SameSite](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie/SameSite) on MDN docs

### Lax

The default

> Cookies are not sent on normal cross-site subrequests (for example to load images or frames into a third party site), but are sent when a user is navigating to the origin site (i.e., when following a link).

```
SameSite=lax
```

### Strict

Restrict to first-party access.

```
SameSite=strict; Secure
```

Why set `Secure`?

> If `SameSite=None` is set, the cookie Secure attribute must also be set (or the cookie will be blocked).


### Cross-site

Allow thiry-party access

```
Samesite=None
```

## Stringify

How to set an array value in a cookie by stringifying it first.

```javascript
const myValues = ["abc", "def", "xyz"]
const myValuesStr = JSON.stringify(my_interests)

document.cookie = `my_cookie=${myValuesStr}; SameSite=None; Secure; Path=/;`;
```

Then use `JSON.parse` to get it out - after getting just your cookie by name. See [Cookie recipes][]. 


## Expiry

Set a value as:

```
Expires=GMT_TIMESTAMP
```

e.g. Using `(new Date).toGMTString()`

```
Expires=Mon, 13 Sep 2021 10:22:50 GMT
```

You can use max age, but this is not supported on old browsers like Internet Explorer - [source](https://stackoverflow.com/questions/23197106/what-is-the-difference-between-cookies-maxage-and-expiry#37495774).

```javascript
const expiry = new Date();
const currSeconds = expiry.getSeconds();
expiry.setSeconds(currSeconds + 30);

const value = "abcdef 123"

document.cookie = `my_cookie=${value}; SameSite=None; Secure; Path=/; Expires=${expiry.toGMTString()}`;
```
