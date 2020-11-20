# Time-handling
> Working with dates and times in Jekyll

{% raw %}

See [Date formatting](https://learn.cloudcannon.com/jekyll/date-formatting/) tutorial.


## Date input

Sample datetime value in metadata. Must be valid or Jekyll will throw an error.

```yaml
date: 2020-04-01 20:30:00 +0200
```

Another valid format, used for some examples below.

```yaml
date: 2016-03-23T10:20:00Z
```

## Conversion

### Basic

Code:

```liquid
{{ page.date | date_to_string }}
```

Result:

```
23 Mar 2016
```

### Long string

Code:

```
{{ page.date | date_to_long_string }}
```

Result:

```
23 March 2016
```

### Date

Output

```liquid
{{ page.date | date: "%Y/%m/%d" }}
```
```
2020/02/01
```

```liquid
{{ page.date | date: "%-d %B %Y"}}
```

```
1 February 2020
```

### ISO format

```liquid
{{ page.date | date_to_rfc822 }}
```

```
Wed, 23 Mar 2016 23:20:00 +1300
```

### Date and time

```liquid
{{ page.date | date_to_xmlschema }}
```

```
2016-03-23T23:20:00+13:00
```

{% endraw %}
