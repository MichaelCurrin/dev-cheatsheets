# HTML

HTML will render in markdown, so you can do things not possible in markdown.


```html
<p>
    This is a paragraph with **markdown bold** which will be ignored.
    This is the next line but there was no break tag so it is on the same line.
</p>
```

<p>
    This is a paragraph with **markdown bold** which will be ignored.
    This is the next line but there was no break tag so it is on the same line.
</p>


## Comments

HTML comments will not be visible when viewed as HTML. So they are good for notes to yourself.

```html
<!-- TODO: Something to do. -->
```

<!-- TODO: Something to do. -->

Especially good for a static website where you don't want your TODO items to show up on the site. Though you might want to use the Jekyll `{% comment %}` filter if you want to avoid your comment from being rendered as HTML source.


## Formatting

The `kbd` HML tag can be used for keyboard commands. For example:

```html
Press <kbd>Esc</kbd>
```

Press <kbd>Esc</kbd>


## Warning notes

Be careful when putting markdown instead HTML tags.

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
