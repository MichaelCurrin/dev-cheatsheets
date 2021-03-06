# Syntax

{% raw %}

See [Regex101](https://regex101.com/) for trying patterns and a searchable guide to syntax.


## Character types

```re
\d
\D

\w
\W

[a-z]
[a-zA-Z]
[a-zA-Z0-9]

\s
\S

.
\.

:alpha:
:digit:
:space:
```


## Repeat

```re
\w+
\w*
\w?

\w{2}
\w{4}
\w{2,4}
```


## Insert

Note use of `$1` to keep the original text. Brackets seem to be needed for this to work.

Applied VS Code regex replace.

### Add character

Add header symbol before a number.

- Find: `\d`
- Replace with: `# $1`

### Add break tag

Insert `br` tag at the end of lines which are not headings or empty lines.

- Find: `(^[^#].+)`
- Replace with: `$1<br>`


## Modifiers

The notes here are for JavaScript but there will be equivalents in other languages.

### Multiline

[m modifier](https://www.w3schools.com/jsref/jsref_regexp_m.asp) for multiline searches.

> Do a multiline search for "is" at the beginning of each line in a string:

```javascript
var str = "\nIs th\nis it?";
var patt1 = /^is/m;
```

> The m modifier treat beginning (`^`) and end (`$`) characters to match the beginning or end of each line of a string (delimited by `\n` or `\r`), rather than just the beginning or end of the string.

### Global

[g modified](https://www.w3schools.com/jsref/jsref_regexp_g.asp)

```javascript
var str = "Is this all there is?";
var patt1 = /is/g;
```

> The `g` modifier is used to perform a global match (find all matches rather than stopping after the first match).

### Insensitive

[i modifier](https://www.w3schools.com/jsref/jsref_regexp_i.asp)

> Do a case-insensitive search for "w3schools" in a string:

```javascript
var str = "Visit W3Schools";
var patt1 = /w3schools/i;
```


## Exclude

### Exclude characters

Use `^` inside `[]` to exclude. Note `a-z` will work and a `-` must be at the start of the end to match a literal `-`.

```re
[^\w-]
```

### Exclude words

Source: [regextester](https://www.regextester.com/15)

```re
^((?!badword).)*$
```

```
badword
test      # match
one two   # match
abadwords
three     # match
```

Multiple exclusions:

```re
?!(foo|bar)

?!(http|[{#])
```


## Groups

A non-captured and a captured part of a pattern.
```re
\w (\w)
```

Named group.

```re
(?<foo>\w)
```

Non-capturing group. If you want to use brackets to make a group such as to make it be repeated, but don't care about capturing it.

```re
(?:\w) (\w)
```


{% endraw %}
