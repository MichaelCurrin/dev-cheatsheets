---
description: Working with dates and times in Jekyll
---
# Time-handling

{% raw %}

See [Date formatting](https://learn.cloudcannon.com/jekyll/date-formatting/) tutorial.


## Now

### Date

```liquid
{{ 'now' | date: "%Y/%m/%d" }}
```
```
2021/04/18
```

### Date and time

```liquid
{{ 'now' | date_to_xmlschema }}
```
```
2021-04-18T20:27:23+02:00
```


## Date input

Sample datetime value in metadata. Must be valid or Jekyll will throw an error.

```yaml
date: 2020-04-01 20:30:00 +0200
```

Another valid format, used for some examples below.

```yaml
date: 2016-03-23T10:20:00Z
```

Note that if you give a value as:

```yaml
date: 2020-04-01
```

Then Jekyll will convert it to a time.

```liquid
{{ page.date }}
```
```
2020-04-01 00:00:00 +0200
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

### Year / month / day

```liquid
{{ page.date | date: "%Y/%m/%d" }}
```
```
2020/02/01
```

### Custom

```liquid
{{ page.date | date: "%-d %b %Y" }}
```

```
1 Feb 2020
```

Just year:

```liquid
{{ page.date | date: "%Y" }}
```

```
2020
```

## Ordinal

> One notable exclusion from this list getting the ordinal date. For example we couldn’t output “May 23rd” because there’s no placeholder for the “rd”.
>
> A workaround for this is to use Liquid to calculate and output the ordinal.

```liquid
{% assign day = page.date | date: "%-d" %}
{% case day %}
    {% when '1' or '21' or '31' %}{{ day }}st
    {% when '2' or '22' %}{{ day }}nd
    {% when '3' or '23' %}{{ day }}rd
    {% else %}{{ day }}th
{% endcase %}
{{ page.date | date: "of %B, %Y" }}
```
```
23rd of March, 2016
```


## Placeholders

| Placeholder | Format                                                                                             | Example                  |
| ----------- | -------------------------------------------------------------------------------------------------- | ------------------------ |
| %a          | Abbreviated weekday                                                                                | Sun                      |
| %A          | Full weekday name                                                                                  | Sunday                   |
| %b          | Abbreviated month name                                                                             | Jan                      |
| %B          | Full month name                                                                                    | January                  |
| %c          | Preferred local date and time representation                                                       | Fri Jan 29 11:16:09 2016 |
| %d          | Day of the month, zero-padded                                                                      | 05                       |
| %-d         | Day of the month                                                                                   | 5                        |
| %D          | Formats the date                                                                                   | 29/01/16                 |
| %e          | Day of the month                                                                                   | 3                        |
| %F          | Returns the date in ISO 8601 format                                                                | 2016-01-29               |
| %H          | Hour of the day, 24-hour clock                                                                     | 07                       |
| %I          | Hour of the day, 12-hour clock                                                                     | 04                       |
| %j          | Day of the year                                                                                    | 017                      |
| %k          | Hour of the day, 24-hour clock                                                                     | 7                        |
| %m          | Month of the year                                                                                  | 04                       |
| %M          | Minute of the hour                                                                                 | 09                       |
| %p          | Meridian indicator uppercase                                                                       | AM                       |
| %P          | Meridian indicator lowercase                                                                       | pm                       |
| %r          | 12-hour time                                                                                       | 01:31:43 PM              |
| %R          | 24-hour time                                                                                       | 18:09                    |
| %T          | 24-hour time with seconds                                                                          | 18:09:13                 |
| %s          | Number of seconds since 1970-01-01 00:00:00 UTC                                                    | 1452355261               |
| %S          | Second of the minute                                                                               | 05                       |
| %U          | Week number of the current year, starting with the first Sunday as the first day of the first week | 03                       |
| %W          | Week number of the current year, starting with the first Monday as the first day of the first week | 09                       |
| %w          | Day of the week. Sunday is 0                                                                       | 4                        |
| %x          | Preferred representation for the date                                                              | 05/11/15                 |
| %X          | Preferred representation for the time                                                              | 17:15:31                 |
| %y          | Year without a century                                                                             | 16                       |
| %Y          | Year with a century                                                                                | 2016                     |
| %Z          | Time zone name                                                                                     | PST                      |
| %%          | Literal `%` character                                                                              | %                        |

{% endraw %}
