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
