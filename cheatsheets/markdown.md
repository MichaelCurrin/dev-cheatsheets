# Markdown Cheatsheet

Cheatsheet for content of `.md` or `.markdown` files. This is not meant to be complete but rather useful as a quick reference for the things I need look up occasionally, so it excludes some basics such as headers.

Some content comes from [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

## Basics

```
# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_

[Link](url) and ![Image](src)
```

### Code

#### Code styling

```
Example of `code` in a sentence.
```

Example of `code` in a sentence.


#### Code blocks

```
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

#### Code blocks in bullet points

    - They also work nicely under bullet points like this.
        ```
        print('Code goes here')
        ```

- They also work nicely under bullet points like this.
    ```
    print('Code goes here')
    ```

## Todo list

Hard brackets. With either space or lowercase `x`.

```
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

```
<!-- TODO: Something to do. -->
```

<!-- TODO: Something to do. -->

Especially good for a static website where you don't want your TODO items to show up on the site. Though you might want to use the Jekyll `{% comment %}` filter if you want to avoid your comment from being rendered as HTML source.

### Formatting

The `kbd` HML tag can be used for keyboard commands. For example:

```
Press <kbd>Esc</kbd>
```

Press <kbd>Esc</kbd>

## Emojis

```
:sparkles:
```

:sparkles:


## Links

### File

```
[link text](file.txt)
[link text](/app/file.txt)
[link text](../file.txt)
```

### URL

```
[link text](https://example.com)
```

### Alt text

Add alt text. Hover over the link to see the alt text.

```
[link text](files/path/to/file "alt text")
```

### Reference-style links

### Text

[I'm a reference-style link][Arbitrary case-insensitive reference text]

[arbitrary case-insensitive reference text]: https://www.mozilla.org

```
[I'm a reference-style link][Arbitrary case-insensitive reference text]

[arbitrary case-insensitive reference text]: https://www.mozilla.org
```

### Number

[You can use numbers for reference-style link definitions][1]

[1]: http://slashdot.org

```
[You can use numbers for reference-style link definitions][1]

[1]: http://slashdot.org
```

### Link text

Or leave it empty and use the [link text itself].

[link text itself]: http://www.reddit.com

```
Or leave it empty and use the [link text itself].

[link text itself]: http://www.reddit.com
```

## Images

### Inline-style

![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")

```
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")
```

### Reference-style

![alt text][logo]

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 2"

```
![alt text][logo]

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 2"
```

### Plain HTML


```html
<img src="image.png">
```

### Styled HTML

Resize and center an image.

```html
<p align="center">
    <img width="250" src="image.png">
</p>
```

## Wiki

Note that if you editing markdown content in a Github, the rules are different for some elements. See this [gist](https://gist.github.com/subfuzion/0d3f19c4f780a7d75ba2).
