# Markdown Cheatsheet

Cheatsheet for content of `.md` or `.markdown` files. 

## Notes

This is not meant to be complete but rather useful as a quick reference for the things I need look up occasionally, so it excludes some basics such as headers.

Most of the content here is intended for Github Flavored Markdown (GFM) to be viewed on Github or an IDE which supports Markdown. Some the content is HTML which will render well in a markdown file on Github.

Some content comes from [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet). See also the the Wordpress [Markdown Quick Reference](https://en.support.wordpress.com/markdown-quick-reference/).

## Common formatting

### Headings

```markdown
# Header 1

## Header 2

### Header 3

Alternative below - note there is no whitespace and no `#`.

Header 1
===

Header 2
---
```

### Horizontal rule

```markdown
See the triple dash with white space before it.

---

More content here.
```


```markdown
**Bold**
__Bold alt__

_Italics_
*Italtics alt*

_**Nested styling**_
```

### Links

```markdown
[Link](url)

![Image](src)
```

### Paragraphd

If there are two paragraph lines with no break between, Markdown will show them on online. Therefore you can either add white space between, use a `<br>` tag, or use a double white space at the end of the line (not pratical if your IDE trims whitespace).

```markdown
Line 1

Line 2

Line 3 and
continuation of line 3.
```

### Quotes

The line break rule applies to quotes two as below.

```
> Quote

> Multi-line quote.
>
> Note the empty line above.

> This quote
> actually appears on one line.

> How to nest a quote.
> > Repeat the quote symbol.
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
![My image](foo.jpg)

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

### SVGs

Format:

    ![Alt text](foo.svg)
    
    ![Alt text](https://example.com/foo.svg)

Example:

    ![Alt text](https://placeholder.pics/svg/200x60/DEDEDE/555555/Sample%20SVG)

![Alt text](https://placeholder.pics/svg/200x60/DEDEDE/555555/Sample%20SVG)

#### Github links

##### raw.githubusercontent.com

If you reference an image on Github through the Raw button, you get a link on `raw.githubusercontent.com`. You might add this to the URL to avoid getting an error: `?sanitize=true`.

 Example of the above. This could be markdown but is HTML to set the width.

```html
<img width="100px" 
     src="https://raw.githubusercontent.com/graphql/graphql-spec/master/resources/GraphQL%20Logo.svg?sanitize=true">
```

<img width="100px" 
     src="https://raw.githubusercontent.com/graphql/graphql-spec/master/resources/GraphQL%20Logo.svg?sanitize=true">

Image link from Wikipedia icon [here](https://en.wikipedia.org/wiki/GraphQL).

If you use a different domains below, though you do **not** need the sanitize parameter.

#### github.io

No sanitize parameter needed.

i.e. A Github Pages site's asset.

    ![Alt text](https://potherca-blog.github.io/StackOverflow/question.13808020.include-an-svg-hosted-on-github-in-markdown/controllers_brief.svg)

![Alt text](https://potherca-blog.github.io/StackOverflow/question.13808020.include-an-svg-hosted-on-github-in-markdown/controllers_brief.svg)

#### rawgithub.com

No sanitize parameter needed.

    ```
    ![Alt text](https://rawgithub.com/potherca-blog/StackOverflow/master/question.13808020.include-an-svg-hosted-on-github-in-markdown/controllers_brief.svg)
    ```

![Alt text](https://rawgithub.com/potherca-blog/StackOverflow/master/question.13808020.include-an-svg-hosted-on-github-in-markdown/controllers_brief.svg)


## Wiki

Note that if you editing markdown content in a Github, the rules are different for some elements. See this [gist](https://gist.github.com/subfuzion/0d3f19c4f780a7d75ba2).


## Table

The first row is the header and always followed by a row of dashes.

    A   | B   | C
    --- | --- | ---
    Foo | 1   |
    Bar | 2   |
    Baz | 3   |

A   | B   | C
--- | --- | ---
Foo | 1   |
Bar | 2   |
Baz | 3   |

You can use styling (bold, italics, code, links). Cells with long sentences will wrap automatically.

The output table will set optimal width for each column. So it is optional to keep a cells in a column the same width in markdown. It helps for readability.

Use optional colons for alignment. You can also add a border to the markdown, which does not affect the output. See the following example. [source](https://www.tablesgenerator.com/markdown_tables)

    | Tables   |      Are      |  Cool |
    |----------|:-------------:|------:|
    | col 1 is |  left-aligned | $1600 |
    | col 2 is |    centered   |   $12 |
    | col 3 is | right-aligned |    $1 |


| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

Note there are VS Code extension which help with table formatting such as making cells in a column all the same width.

There are also online tools such as [Markdown tables generator](https://www.tablesgenerator.com/markdown_tables).
