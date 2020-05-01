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
