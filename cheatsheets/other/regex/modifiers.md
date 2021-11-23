# Modifiers

The notes here are for JavaScript but there will be equivalents in other languages.

## Multiline

[m modifier](https://www.w3schools.com/jsref/jsref_regexp_m.asp) for multiline searches.

> Do a multiline search for "is" at the beginning of each line in a string:

```javascript
const str = "\nIs th\nis it?";
const patt1 = /^is/m;
```

> The m modifier treat beginning (`^`) and end (`$`) characters to match the beginning or end of each line of a string (delimited by `\n` or `\r`), rather than just the beginning or end of the string.

## Global

[g modified](https://www.w3schools.com/jsref/jsref_regexp_g.asp)

```javascript
const str = "Is this all there is?";
const patt1 = /is/g;
```

> The `g` modifier is used to perform a global match (find all matches rather than stopping after the first match).

## Insensitive

[i modifier](https://www.w3schools.com/jsref/jsref_regexp_i.asp)

> Do a case-insensitive search for "w3schools" in a string:

```javascript
var str = "Visit W3Schools";
var patt1 = /w3schools/i;
```
