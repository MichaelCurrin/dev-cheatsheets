---
description: HTML tags
---
# Tags


See [HTML Element Reference](https://www.w3schools.com/tags/) on W3 schools.

See specific tags of interest to me covered below.

- [div](https://www.w3schools.com/tags/tag_div.asp)
- [blockquote](https://www.w3schools.com/tags/tag_blockquote.asp)
- `mark` - highlighting by default in yellow


## Code and pre

- [code](https://www.w3schools.com/tags/tag_code.asp)
- [pre](https://www.w3schools.com/tags/tag_pre.asp)

Use `pre` for preformatted text - linebreaks are kept and HTML symbols don't need escaping.

Use `code` for representing code snippets or if you have actual JSON data for example to store on the page.

**Code**

```html
<pre>Using the
pre tag
over multiple lines.</pre>
```

**Result**

<pre>Using the
pre tag
over multiple lines.</pre>

**Code**

It's best to keep everything one line to avoid rendering the whitespace.

```html
<code><pre>console.log('Hello, world');</pre></code>
```

**Result**

<code><pre>console.log('Hello, world');</pre></code>

**Code**

```html
<code><pre><div>HTML snippet</div></pre></code>
```

**Result**

<code><pre><div>HTML snippet</div></pre></code>



## Table

See [table](https://www.w3schools.com/tags/tag_table.asp) tutorial

```html
<table>
    <tr>
        <th>Month</th>
        <th>Savings</th>
    </tr>
    <tr>
        <td>January</td>
        <td>$100</td>
    </tr>
</table>
```

```
The <table> tag defines an HTML table.

An HTML table consists of one <table> element and one or more <tr>, <th>, and <td> elements.

The <tr> element defines a table row, the <th> element defines a table header, and the <td> element defines a table cell.

An HTML table may also include <caption>, <colgroup>, <thead>, <tfoot>, and <tbody> elements.
```


## Nav

[nav](https://www.w3schools.com/tags/tag_nav.asp)

```html
<nav>
    <a href="/html/">HTML</a> |
    <a href="/css/">CSS</a> |
    <a href="/js/">JavaScript</a> |
    <a href="/python/">Python</a>
</nav>
```

```
The <nav> tag defines a set of navigation links.

Notice that NOT all links of a document should be inside a <nav> element. The <nav> element is intended only for major block of navigation links.

Browsers, such as screen readers for disabled users, can use this element to determine whether to omit the initial rendering of this content.
```
