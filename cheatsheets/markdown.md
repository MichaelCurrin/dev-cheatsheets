# Markdown Cheatsheet

Applies to `.md` or `.markdown` files as both are equivalent.

In some cases this guide contents HTML tags as these give more flexibility than markdown, though are usually more verbose. These HTML tags will render in both markdown documents and `.html` files.

You can mix HTML and markdown together together in a markdown document, however, they cannot overlap. If you put markdown content between HTML tags (such as between opening and closing `p` tag, the markdown will just render as plain text.

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

The following are equivalent, though Github's markdown editor only shows a preview in the edit window for the later.

```markdown
~Strikethrough~
~~Strikethrough~~
```

### Links

```markdown
[Link](url)

![Image](src)
```

### Paragraph

If there are two paragraph lines with no break between, Markdown will show them on online. Therefore you can either add white space between, use a `<br>` tag, or use a double white space at the end of the line (not pratical if your IDE trims whitespace).

```markdown
Line 1

Line 2

Line 3 and
continuation of line 3.
```

### Quotes

Single line.

```markdown
> Quote
```

Multi-line. Note that the line break rule from the previous section applies to quotes as below.

```markdown
> Multi-line quote.
>
> Note the empty line above.

> This quote
> actually appears on one line.
```

Nesting quotes.

```markdown
> How to nest a quote.
> > Repeat the quote symbol.
```

Quote a list of bullet points (from one source).

```markdown
> - Point A
> - Point B
> - Point C
```

Add quotes from multiple sources to separate bullet points.

```markdown
- > Point A
- > Point B
- > Point C
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

You get monospaced text with no syntax highlighting if you do not specify a language.

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

They also work nicely under bullet points. See [Code snippets in lists](#code-snippets-in-lists)] above.

#### Language choices for syntax highlighting

Some valid references for language-specific styling:

- `markdown` or `md`
- `json` or `json5` (the latter is built on top of JSON and supports comments)
- `python`
- `ruby`
- `html`
- `javascript` or `js`
- `sh`
- `bash`


**Links:**

- The full list that Github supports, on the Linguist repo:
	- https://github.com/github/linguist/blob/master/lib/linguist/languages.yml
- This is separate by similar and easier to read:
	- https://github.com/HappenApps/Quiver/wiki/Syntax-Highlighting-Supported-Languages
- Rogue highlighter used for Github Pages
	- https://github.com/rouge-ruby/rouge


## Todo list

Hard brackets. With either space or lowercase `x`.

```markdown
- [ ] not done.
- [x] done
```

- [ ] not done
- [x] done


## HTML

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

### Warning notes

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


## Emojis

Note, this works in Github-flavored Markdown, but might not work in certain markdown viewers unless you use a plugin.

```markdown
:sparkles:
```

:sparkles:

## Escaping

Prevent markdown from rendering certaim styling, you can escape them. In the examples below the italics are part of a filename and italics styling is unwanted.


### Escape with code ticks

Code ticks escapes any styling characters inside them.

    Update the `_config.yml` file then run [`__init__.py`](__init__.py).

Update the `_config.yml` file then run [`__init__.py`](__init__.py).


### Escape text with backslash

    Update the \_config.yml file then run \_\_init\_\_.py.

Update the \_config.yml file then run \_\_init\_\_.py.

### Escaping links

Escape the link text using backslash or backticks. The target does not need escaping.

    Update the [\_config.yml](_config.yml) file.

Update the [\_config.yml](_config.yml) file.

## Links

### Format

A markdown link's format is:


```markdown
[link text](target)

[](target)
```

The link text is what will be shown on error or while the image is loading. It can also help with SEO. It can be left blank.

The target should be either a **local** file path in the repo, or a **remote** URL. The target should **not** be blank, otherwise it will just link to the current page.


### File

The path is by default **relative** to the current path.

```markdown
[link text](bar.txt) - File name.

[link text](./bar.txt) - Equivalent to the above, but more verbose, so not common.

[link text](foo/bar.txt) - Path to file.
```

You can ascend in the directory, using the double dots.

```markdown
[link text](../fizz/buzz.txt)
```

Use a forwardslash to indicate a path relative to the **root**, ignoring the current path.

```markdown
[link text](/app/file.txt)
```

Use an encoded space as **%20** to escape a space in a path, to avoid an error in rendering markdown. Using a backspace in front of a space does **not** work.

```markdown
[link text](/Foo%20Bar/baz.txt)
```

Additionally, you can use IDs in your target to you can jump to an element with that ID, typically a heading.

```markdown
## My first heading

Content

## My second heading

More content.

Click to go to [My first heading](#my-first-heading).
```

The target could go to another page.

```markdown
[Foo bar](foo#bar)

[Foo bar](https://example.com#bar)
```

### URL

Set the target as a full URL, requiring protocol, domain and optional path.

```markdown
[link text](https://example.com/foo/bar)
```

Regarding protocol - the URL **must** start with `http` or `https`, otherwise the link will in invalid.

For example, this will link add `/example.com` to the current path.

```markdown
[Bad example](example.com)
```

### Alt text

Add optional alternative text. You can hover over the link to see the alt text.

**Code:**
```markdown
[link text](https://example.com "alt text")
```

**Result:**

```markdown
[link text](https://example.com "alt text")
```

### Reference-style links

### Text

Example:

**Code:**

```markdown
[I'm a reference-style link][Arbitrary case-insensitive reference text]

[arbitrary case-insensitive reference text]: https://www.mozilla.org
```


**Result:**


Code:

```markdown
[I'm a reference-style link][Arbitrary case-insensitive reference text]

[arbitrary case-insensitive reference text]: https://www.mozilla.org

```

### Number

Example:


**Code:**

```markdown
[You can use numbers for reference-style link definitions][1]

[1]: http://slashdot.org
```

**Result:**


Code:

```markdown
[You can use numbers for reference-style link definitions][1]

[1]: http://slashdot.org
```

### Link text

Example:

**Code:**

```markdown
Or leave it empty and use the [link text itself].

[link text itself]: http://www.reddit.com
```

**Result:**

Code:

```markdown
Or leave it empty and use the [link text itself].

[link text itself]: http://www.reddit.com

```

## Images

Images in mardown as similar to a hyperlink, except it starts with an **exclamation mark**.

The following apply, as with standard links:

- The target can point to a **local** file in the repo or a **remote** URL, as with standard links.
- The text in the first part is alternative text shown while the image is loading (or if fails to load).
- Optional text can be included at the end, to show on hover over.

### General format

```markdown
![Alt text](target)

![Alt text](target "Hover text")
```

Example codCode sample:

```markdown
![My image](foo.jpg)
```

Note that for local paths, the target is **case sensitive**. Github will show an error otherwise. Some IDE extensions are case-insensitive and so hide errors that will appear on Github.


### Example of inline vs reference style

#### Inline-style

Example:

**Code**:

```
![Alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "This text shows on hover")
```

**Result:**


Code:

```
![Alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "This text shows on hover")

```

#### Reference-style


**Code**:

```markdownExample:

![Alt text][logo]

Some more text.

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "This text shows on hover"

There is a logo above but this elemement but it is not visible in the rendered HTML.
```

**Result**:

Code:

```markdown
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

Resize and center an image using HTML attributes.

Github also sets max-width to `100%` on the CSS when rendering the page, so that means your image can take up a lot of space.

A good way to do this is set the exact height - letting the pixel width change based on desktop or mobile. Fine-the value per image.

```html
<p align="center">
    <img height="300px" src="foo.png">
</p>
```

Or use a relative width value:

- `width="80%"`

Notes:

- Centering and resizing as above **cannot** be achieved by setting CSS (inline or in a style tag) on Github, so you must update attributes of the tags.
- The resizing above works for _HTML_ tags in markdown, but resizing cannot be done for _markdown_ image. At least in Github-flavored implementation of markdown - some other systems support resizing e.g. `![Alt](img.jpg =60x50)`.

### SVGs

Format:

```markdown
![Alt text](foo.svg)

![Alt text](https://example.com/foo.svg)
```

Example

**Code:**:

```markdown
![Alt text](https://placeholder.pics/svg/200x60/DEDEDE/555555/Sample%20SVG)
```

**Result**

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

```markdown
![Alt text](https://potherca-blog.github.io/StackOverflow/question.13808020.include-an-svg-hosted-on-github-in-markdown/controllers_brief.svg)
```

![Alt text](https://potherca-blog.github.io/StackOverflow/question.13808020.include-an-svg-hosted-on-github-in-markdown/controllers_brief.svg)

#### rawgithub.com

No sanitize parameter needed.

```markdown
![Alt text](https://rawgithub.com/potherca-blog/StackOverflow/master/question.13808020.include-an-svg-hosted-on-github-in-markdown/controllers_brief.svg)
```

![Alt text](https://rawgithub.com/potherca-blog/StackOverflow/master/question.13808020.include-an-svg-hosted-on-github-in-markdown/controllers_brief.svg)


## Wiki

Note that if you editing markdown content in a Github, the rules are different for some elements. See this [gist](https://gist.github.com/subfuzion/0d3f19c4f780a7d75ba2).


## Table

The first row is the header and always followed by a row of dashes.

**Code:**

    | A   | B   | C   |
    | --- | --- | --- |
    | Foo | 1   |
    | Bar | 2   |
    | Baz | 3   |

**Result:**Example:

| A   | B   | C   |
| --- | --- | --- |
| Foo | 1   |
| Bar | 2   |
| Baz | 3   |


You can use styling (bold, italics, code, links). Cells with long sentences will wrap automatically.

The output table will set optimal width for each column. So it is optional to keep a cells in a column the same width in markdown. It helps for readability.

Use optional colons for alignment. You can also add a border to the markdown, which does not affect the output. See the following example. [source](https://www.tablesgenerator.com/markdown_tables)


**Code:**

    | Tables   |      Are      |  Cool |
    | -------- | :-----------: | ----: |
    | col 1 is | left-aligned  | $1600 |
    | col 2 is |   centered    |   $12 |
    | col 3 is | right-aligned |    $1 |

**Result:**Example:

| Tables   |      Are      |  Cool |
| -------- | :-----------: | ----: |
| col 1 is | left-aligned  | $1600 |
| col 2 is |   centered    |   $12 |
| col 3 is | right-aligned |    $1 |


Note there are VS Code extension which help with table formatting such as making cells in a column all the same width.

There are also online tools such as [Markdown tables generator](https://www.tablesgenerator.com/markdown_tables).


## Collapsible items

How to create sections which can expand and collapse again.

Use the `details` and `summary` HTML tags in markdown on Github, without any additional CSS.

Format:

    <details>
    <summary>TITLE</summary>

    BODY CONTENT

    </details>


See example below, which uses the bold tag in the title.

**HTML code:**

    <details>
    <summary><b>Preview title</b></summary>
	
    _Note that markdown is valid but you need empty lines to separate from the HTML tags._
    
    - Bullet
    - Points.

    ```json
    {
        "codeblock": "demo"
    }
    ```
    
    </details>

**Result:**

<details>
<summary><b>Preview message</b></summary>

_Note that markdown is valid but you need empty lines to separate from the HTML tags._

- Bullet
- Points.

```json
{
"codeblock": "demo"
}
```

</details>


### Jekyll

Example using Jekyll templating. In particular, putting a code block inside the expandable section.

**Sample Jekyll/Liquid code**

Here is the code:

```
<details>
<summary>
Preview
</summary>

{% highlight ruby %}
puts 'Expanded message'
{% endhighlight %}

</details>
```

**Sample rendered HTML as codesult**

_Using the code above in a Jekyll site, here is the result after building to plain HTML._ndered result.

<details>
<summary>
Preview
</summary>

<figure class="highlight">
    <pre>
        <code class="language-ruby" data-lang="ruby">
        <span class="nb">puts</span> <span class="s1">'Expanded message'</span>
        </code>
    </pre>
</figure>

</details>

<br>

**Sample HTML for displayingoutput**

_Here is the rendered result above shown in a code block below, for clarity. The only change was wrapping, for readability._


```html
<details>
<summary>
Preview
</summary>

<figure class="highlight">
    <pre>
        <code class="language-ruby" data-lang="ruby">
        <span class="nb">puts</span> <span class="s1">'Expanded message'</span>
        </code>
    </pre>
</figure>
```


**Note**

To explain the approach here - if you want to use Jekyll templating, markdown does **not** get picked up here correctly. So if you want a code block in your expanded block, you need to use HTML or the `highlight` Liquid tag. Whether using triple backticks or indentation for a code block inside the details tag, those just end up being used literally.

## Contact

### Email

- Markdown
	```markdown
	<foo@bar.com>
	```
- HTML
	```html
	<a href="mailto:foo@bar.com">foo@bar.com</a>
	```
- Result
	- <foo@bar.com>


### Phone number

- Markdown
	```markdown
	[+44 20 7123 4567](tel:+442071234567)
	```
- Rendered HTML
	```html
	<a href="tel:+442071234567">+44 20 7123 4567</a>
	```
- Result
	- [+44 20 7123 4567](tel:+442071234567)

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTQ5MjE2NzI1XX0=
-->
