# Jekyll time cheatsheet

- [Date formatting](https://learn.cloudcannon.com/jekyll/date-formatting/) tutorial.


Sample datetime value in metadata. Must be valid or Jekyll will throw an error.

```yaml
date: 2020-04-01 20:30:00 +0200
```

Another valid format, used for examples below.

```yaml
date: 2016-03-23T10:20:00Z
```


```
{{ page.date | date_to_long_string }}
```

```
23 March 2016
```



<!--stackedit_data:
eyJoaXN0b3J5IjpbNDE3ODEzNDU3XX0=
-->