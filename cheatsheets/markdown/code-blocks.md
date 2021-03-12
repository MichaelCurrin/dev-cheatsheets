# Code blocks

See also the [Jekyll Supported Languages][] page.

[Jekyll Supported Languages]: {{ site.baseurl }}{% link cheatsheets/jekyll/code-blocks/supported-languages.md %}


## Code styling

You get mono-spaced text with no syntax highlighting if you do not specify a language.

```
Example of `code` in a sentence.
```

Example of `code` in a sentence.


## Code blocks

### Indent syntax

Indent the code by 4 spaces.

```markdown
    # Indenting this line in markdown turned it into preformatted mono-spaced text, without any particular code syntax.
    print('Hello world'!)
```

    # Indenting this line in markdown turned it into preformatted mono-spaced text, without any particular code syntax.
    print('Hello world'!)


### Backtick syntax

Use triple backtick also known as a fenced code block. You can optionally specify a language for format with - this works well in markdown on GitHub but you might need extra setup in a Jekyll theme to get it to work properly.

    ```python
    # Triple quotes are for code blocks and give more control over the language.
    print('Hello world'!)
    ```

```python
# Triple quotes are for code blocks and give more control over the language.
print('Hello world'!)
```

They also work well under bullet points - see [Code snippets in lists][].

[Code snippets in lists]: {{ site.baseurl }}{% link cheatsheets/markdown/lists.md %}#code-snippets-in-lists)

The short name works too. Note that outside of GitHub, other editing tools like an IDE or StackEdit might only support the long or the short form of a language.

	```py
	print("Hello, world!")
	```

```py
print("Hello, world!")
```


## Supported languages

Some valid references for language-specific styling that I use. There are many more available.

- `markdown` or `md`
	- The former shows better rendering in the GitHub editor view.
- `json`
- `json5`
	- Support comments without giving red errors when rendered.
- `python` or `py`
- `ruby` or `rb`
- `html`
- `javascript` or `js`
- `sh` or `bash` (or the less common `shell`)
- `diff`
- `liquid`
- `yaml` or `yml`
- `regex` or `re`
	- The former actually provide more/better highlighting when viewing the rendered content.
- `mk`, `make`, `Makefile` (or lowercase).
	- These all work, I haven't compared how well though.


### Examples

#### Diff

	```diff
	- a
	+ b
	```

```diff
- a
+ b
```

#### JSON

	```json
	{
	    "foo": "bar"
	}
	```

```json
{
    "foo": "bar"
}
```

With comments, use `json5` to avoid getting errors for invalid content on GitHub. Note some platforms like StackEdit don't recognized `json5` but is okay.

	```json5
	{
	    // This is a comment.
	    "foo": "bar"
	}
	```


```json5
{
    // This is a comment.
    "foo": "bar"
}
```

#### Regex

	```re
	[a-f]+
	```

```re
[a-f]+
```

Note - from limited testing, I found that `re` works better than `regex`.


## Code blocks in bullet points

It can look messy to alternate between bullet points and code blocks, especially if using numbered points.

But you can nest code blocks under bullet points, like this.

Code:

    - First point
        ```
        My code
        ```
    - Second point
        ```
        More code
        ```

Result:

- First point
    ```
    My code
    ```
- Second point
    ```
    More code
    ```

### Warning

You may **not** start a nested code block with a **dash**. Markdown gets confused and the formatting looks broken.

So don't do this:

- First point
    ```
    - My code
    ```
