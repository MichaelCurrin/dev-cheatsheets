# HTML

{% raw %}

> How to add HTML tags to your markdown files

This page is aimed at both markdown docs files on GitHub as well as markdown pages in a Jekyll site.

HTML will render in markdown, so you can do things not possible with plain markdown syntax. Such as add an ID or class or resize and align images. HTML doesn't care about whitespace so much so it is also easier to build a bullet list or table using a if statements and for loops when using HTML rather than markdown.

Related - see [HTML Cheatsheet]({% link cheatsheets/web/html/index.md %}).


## Button

Add a strong call to action with a button. Useful for an external link or a button to Get Started or Downloaded.

_Note: The `button` element will not render in plain markdown but it does work on static sites_.

Example below, with a link.


**Code:**

```html
<a href="https://example.com">
    <button>Click me</button>
</a>
```

**Result:**

<a href="https://example.com">
    <button>Click me</button>
</a>


Add styling on the button or on your site with CSS.


## Comments

HTML comments will not be visible when viewed as HTML. So they are good for notes to yourself.

```html
<!-- TODO: Something to do. -->
```

<!-- TODO: Something to do. -->

Especially good for a static website where you don't want your TODO items to show up on the site. Though you might want to use the Jekyll `comment` filter if you want to avoid your comment from being rendered as HTML source.

```liquid
{% comment %}
Message here
{% endcomment %}
```


## Formatting

The `kbd` HML tag can be used for keyboard commands.


**Code:**

```html
Press <kbd>Esc</kbd>
```

**Result:**

Press <kbd>Esc</kbd>


**Code:**

```html
Press <kbd>CTRL</kbd>+<kbd>C</kbd>
```

**Result:**

Press <kbd>CTRL</kbd>+<kbd>C</kbd>


## Mixing

### Rendering markdown as plain HTML

Node that the markdown here gets ignored inside HTML tags. So you can use a dash or underscore without getting styling.

Code:

```html
<p>
    This is a paragraph with **markdown bold** which will be IGNORED.
    This is the next line but there was no break tag so it is on the same line.
</p>
```

Result:

<p>
    This is a paragraph with **markdown bold** which will be IGNORED.
    This is the next line but there was no break tag so it is on the same line.
</p>

If you actually want to show markdown as code, consider a markdown or Liquid code block instead.

### Rendering markdown in HTML

Be careful when putting markdown instead HTML tags when you do actually want the markdown to be used.

This will work as are open lines between HTML and markdown.

```html
<div>

- A
- B
- C

</div>
```

<div>

- A
- B
- C

</div>

This will not work as expected - the markdown will be treated as plain text and without line breaks.

```html
<div>
- A
- B
- C
</div>
```

<div>
- A
- B
- C
</div>


Indenting 4 spaces causes a code block rather than text. That might be unexpected here:

```html
<div>

    A
    B
    C
    D

</div>
```

<div>

    A
    B
    C
    D

</div>

Solve it with spaces removed. And break tags if neeeded.

```html
<div>
    A<br>
    B<br>
    C<br>
    D
</div>
```

<div>
    A<br>
    B<br>
    C<br>
    D
</div>

Or use ensure every line starts with an opening tag.

```html
<div>

    <p>A</p>
    <p>B</p>
    <p>C</p>
    <p>D</p>

</div>
```

<div>
    <p>A</p>
    <p>B</p>
    <p>C</p>
    <p>D</p>
</div>

{% endraw %}
