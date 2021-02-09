# Email address

{% raw %}


## Basic

Check for one `@` and a domain with at least one dot.

```re
^[^\s@]+@[^\s@]+\.[^\s@]+$
```


## Advanced

Stricter check on first character, disallowed characters and invalid domain.

```re
^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$
```

## RFC

StackOverflow link: [How to validate an email in Javascript](https://stackoverflow.com/a/1373724)

The specific answer linked suggests this most complete answer but warns not to use it.

> The official standard is known as [RFC 2822][]. It describes the syntax that valid email addresses must adhere to. You can (but you shouldn't — [read on][]) implement it with this regular expression.

[RFVC 2822]: https://tools.ietf.org/html/rfc2822#section-3.4.1
[read on]: http://www.regular-expressions.info/email.html

```re
(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])
```

We get a more practical implementation of RFC 2822 if we omit the syntax using double quotes and square brackets. It will still match 99.99% of all email addresses in actual use today.

```re
[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?
```

You'd be far better off not validating an email with JS at all and instead using HTML as follows:

```html
<input type="email" />
```

That will provide immediate user feedback. It won't valid data of course send to your API or form POST request.

You can still style your inputs based on valid and invalid input and the validation is done for you.


## Between breaks

[How to Find or Validate an Email Address](http://www.regular-expressions.info/email.html)

```re
\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b
```

Presumably using case-insensitive matching.

{% endraw %}
