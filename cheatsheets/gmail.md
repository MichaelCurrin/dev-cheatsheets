# Gmail cheatsheet

## Cleaning up

Archiving is the same as remove from inbox.

Archiving removes from inbox and categories and is safer than deleting.

Clearing inbox is a good way to feel lighter.

e.g.

```
in:promotions is:read -starred
```
```
in:inbox  is:read -starred 
```


## Searches

```
is:read
```

```
starred
-starred
```

Not archived. Ignores categories.

```
in:inbox
```

Categories.
```
in:updates
in:promotions 
```

Combined.
```
in:inbox in:updates
```


```
from:foo@bar.com
to:fizz@buzz.com
```

```
before:2020-01-01
```

```
label:Foo-Bar
```

## Filters

Note that even if you go through 1 month ago setting, you get a fixed date.

When doing a search, a lot of things like starred or not chosen end up in has the words section.

Filters are only applied once not in realtime so if you you change how a filter works, you'll have to remove labels first and then apply the filter.

A filter label like unstarred won't know that a message then got starred.

However, the search bar is always realtime when searched.

Though you have to redo as research to stay current, for example starring a message.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIwNjc0NjU0NjddfQ==
-->