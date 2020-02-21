# Markdown Cheatsheet

Cheatsheet for content of `.md` or `.markdown` files. This is not meant to be complete but rather useful as a quick reference for the things I need look up occasionally, so it excludes some basics such as headers.

Some content comes from [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet). See also the the Wordpress [Markdown Quick Reference](https://en.support.wordpress.com/markdown-quick-reference/).

## Basics

```markdown
# Header 1

## Header 2

### Header 3

Header 1
===

Header 2
---

**Bold** and _Italic_

[Link](url) and ![Image](src)

Horizontal rule:

---
```

## Lists

### Bulleted list

    - Bulleted
    - List

- Bulleted
- List

    - Nested
        * Bullet
            + List

    - Nested
        - Bullet
            - List

- Nested
    * Bullet
        + List

- Nested
    - Bullet
        - List

### Numbered list

    1. Numbered
    2. List

1. Numbered
2. List

Note that numbering can be left as all `1.`.

    1. Foo
    1. Bar
    1. Baz

1. Foo
1. Bar
1. Baz

Note the number formatting style will change by itself at each indentation level.

    1. Nested
        1. Bullet
            1. List
        
1. Nested
    1. Bullet
        1. List

### Mixed list

    1. Number
    2. Number
       * Bullet
       * Bullet  
    3. Number
    
1. Number
2. Number
   * Bullet
   * Bullet  
3. Number

### Quotes in lists

    - Top-level
        - > Point A, which is also a quote.
        - Point B
            > Indented, so shows **within** the point neatly.

- Top-level
    - > Point A, which is also a quote.
    - Point B
        > Indented, so shows **within** the point neatly.

Don't do this:

    - Top-level
        - Point A
        > There is no indent here, probably not what you want.
        - Point B

- Top-level
    - Point A
    > There is no indent here, probably not what you want.
    - Point B

### Code snippets in lists

    - Top-level
        - Foo
        - Here is some code, indented so it shows under the point.
            ```python
            print("Hello, world!")
            ```
        - Bar

- Top-level
    - Foo
    - Here is some code, indented so it shows under the point.
        ```python
        print("Hello, world!")
        ```
    - Bar


### Code

#### Code styling

```
Example of `code` in a sentence.
```

Example of `code` in a sentence.

#### Code blocks

```markdown
    # Indententing this line in markdown turned it into preformatted mono-spaced text, without any particular code syntax.
    print('Hello world'!)
```
    
    # Indententing this line in markdown turned it into preformatted mono-spaced text, without any particular code syntax.
    print('Hello world'!)

#### Code blocks with language syyntax

    ```python
    # Triple quotes are for code blocks and give more control over the language.
    print('Hello world'!)
    ```

```python
# Triple quotes are for code blocks and give more control over the language.
print('Hello world'!)
```

They also work nicely under bullet points. See [#code-snippets-in-lists] above.

## Todo list

Hard brackets. With either space or lowercase `x`.

```markdown
- [ ] not done.
- [x] done
```

- [ ] not done
- [x] done


## HTML

HTML will render in markdown. But you will lose any markdown formatting such as headers or line breaks.


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

### Comments

HTML comments will not be visible when viewed as HTML. So they are good for notes to yourself.

```html
<!-- TODO: Something to do. -->
```

<!-- TODO: Something to do. -->

Especially good for a static website where you don't want your TODO items to show up on the site. Though you might want to use the Jekyll `{% comment %}` filter if you want to avoid your comment from being rendered as HTML source.

### Formatting

The `kbd` HML tag can be used for keyboard commands. For example:

```html
Press <kbd>Esc</kbd>
```

Press <kbd>Esc</kbd>

## Emojis

Note, this works in Github-flavored Markdown, but might not work in certain markdown viewers unless you use a plugin.

```markdown
:sparkles:
```

:sparkles:

## Escaping

Prevent markdown from rendering certaim styling, you can escape them. In the examples below the italics are part of a filename and italics styling is unwanted.

### Code ticks

    Update the `_config.yml` file.

Update the `_config.yml` file.

### Backslash

    Update the \_config.yml file.
    
Update the \_config.yml file.


## Links

### File

```markdown
[link text](file.txt)
[link text](/app/file.txt)
[link text](../file.txt)
```

### URL

```markdown
[link text](https://example.com)
```

### Alt text

Add alt text. Hover over the link to see the alt text.

```markdown
[link text](files/path/to/file "alt text")
```

### Reference-style links

### Text

[I'm a reference-style link][Arbitrary case-insensitive reference text]

[arbitrary case-insensitive reference text]: https://www.mozilla.org

```markdown
[I'm a reference-style link][Arbitrary case-insensitive reference text]

[arbitrary case-insensitive reference text]: https://www.mozilla.org
```

### Number

[You can use numbers for reference-style link definitions][1]

[1]: http://slashdot.org

```markdown
[You can use numbers for reference-style link definitions][1]

[1]: http://slashdot.org
```

### Link text

Or leave it empty and use the [link text itself].

[link text itself]: http://www.reddit.com

```markdown
Or leave it empty and use the [link text itself].

[link text itself]: http://www.reddit.com
```

## Images

Images in mardown:
- Similar to a link except it starts with an exclamation mark. 
- The link can point to a local file in the repo or a remote URL.
- The text in the first part is alternative text shown while the image is loading (or if fails to load.
- Optional text can be included at the end to show on hover over.

### General format

```markdown
![Alt text](link)

![Alt text](link "Hover text")
```

Examples:

```markdown
![My image](img/foo.jpg)

![My image](https://example.comg/foo.jpg)
```

### Example of inline vs reference style

#### Inline-style

![Alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "This text shows on hover")

```
![Alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "This text shows on hover")
```

#### Reference-style

![Alt text][logo]

Some more text.

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "This text shows on hover"

There is a logo above but this elemement but it is not visible in the rendered HTML.

```
![Alt text][logo]

Some more text.

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "This text shows on hover"

There is a logo above but this elemement but it is not visible in the rendered HTML.
```

### Plain HTML

For more control, you can use HTML for your images.

```html
<img src="foo.jpg">
```

Here we make the image clickable, to emulate what a markdown image does.

```html
<a href="https://example.com/foo/">
    <img src="https://example.com/bar.png">
</a>
```

### Styled HTML

Resize and center an image.

```html
<p align="center">
    <img width="250" src="foo.png">
</p>
```

## Wiki

Note that if you editing markdown content in a Github, the rules are different for some elements. See this [gist](https://gist.github.com/subfuzion/0d3f19c4f780a7d75ba2).
