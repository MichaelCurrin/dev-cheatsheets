# Cookies


Cookies can store data up to 4kb - a small amount, unlike Storage.

They can be used for authentication, tracking (which sites you've visited before) and personalization (based on your choices like color theme or GDPR cookie opt-in).

Cookies are sent back forth on all HTTP requests, unlike Storage. This makes the requests larger.


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

```javascript
document.cookie = "abc=123"
```

Remember to explicitly set `path` to `/` so the cookie is not restricted to the current page, which is default.

```javascript
document.cookie = "abc=def 123;secure=true;path=/;"
```

 
## Example

How to set an get an array in a cookie.

```javascript
const my_interests = ["abc", "def", "xyz"]
value = JSON.stringify(my_interests)

const expiry = new Date();
const currYear = expiry.getFullYear();
expiry.setYear(currYear + 5);
document.cookie = `my_interests=${value};secure=true;samesite=None;path=/;expires=${expiry.toGMTString()}`;
```
