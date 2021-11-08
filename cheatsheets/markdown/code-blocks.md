# Codeblocks


## Code styling

If you just use backticks as below, you'll get a mono-spaced text all in one color. No language-specific colors.

**Code**:

```md
Example of `code` in a sentence.
```

**Result:**

Example of `code` in a sentence.


## Codeblocks

### Indent syntax

Indent the code by 4 spaces.

Code:

```markdown
    # Indenting this line in markdown turned it into preformatted mono-spaced text, without any particular code syntax.
    print('Hello world'!)
```

Result:

    # Indenting this line in markdown turned it into preformatted mono-spaced text, without any particular code syntax.
    print('Hello world'!)


### Backtick syntax

Use triple backtick also known as a fenced code block. You can optionally specify a language for format with - this works well in markdown on GitHub but you might need extra set up in a Jekyll theme to get it to work properly.

**Code:**

    ```python
    # Triple quotes are for code blocks and give more control over the language.
    print('Hello world'!)
    ```

**Result**:

```python
# Triple quotes are for code blocks and give more control over the language.
print('Hello world'!)
```

Triple backtickcs also works well under bullet points - see [Code snippets in lists][].

[Code snippets in lists]: {{ site.baseurl }}{% link cheatsheets/markdown/lists.md %}#code-snippets-in-lists)

The short name works too. Note that outside of GitHub, other editing tools like an IDE or StackEdit might only support the long or the short form of a language.

**Code**:

	```py
	print("Hello, world!")
	```

**Result**:

```py
print("Hello, world!")
```


You can even nest them, provided you have a bullet point.

**Code**:

    ```md
    - Run the greeting.
        ```sh
        echo 'Hello'
        ```
    ```

**Result**:

```md
- Run the greeting.
    ```sh
    echo 'Hello'
    ```
```
    
    
## Supported languages

Some valid references for language-specific styling, focusing on the ones I use. There are many more available.

See also the [Jekyll Supported Languages][] page.

[Jekyll Supported Languages]: {{ site.baseurl }}{% link cheatsheets/jekyll/code-blocks/supported-languages.md %}

These are usually based on the file extension.

- `markdown` or `md`
	- The former shows better rendering in the GitHub editor view.
- `json`
- `json5`
	- Support comments without giving red errors when rendered.
- `python` or `py`
- `ruby` or `rb`
- `html`
- `javascript` or `js`
- Shell
    - `sh` or `shell`
    - `bash` for 
    - `powershell` for Windows.
    - `console` - for 
- `diff`
- `liquid`
- `yaml` or `yml`
- `regex` or `re`
	- The former actually provide more/better highlighting when viewing the rendered content.
- `mk`, `make`, `Makefile` (or lowercase).
	- These all work, I haven't compared how well though.
- `c`
- `c++`, `cpp`, `cplusplus`

### Examples

#### Shell

Content from [MDBook](https://github.com/rust-lang/mdBook/blob/master/README.md).

I like to use `sh` a lot. I seem to get the same results as using `shell` and also the same as when using `bash` (except in rare cases like DocsifyJS where the Bash plugin doesn't recognize `sh`).

You don't have to use a dollar sign, but it helps indicate you are in a shell console.

Note the output is colored here, unlike in [console](#console) below.

**sh**

```sh
$ cargo install mdbook-linkcheck
$ edit book.toml && cat book.toml
[book]
title = "My Awesome Book"
authors = ["Michael-F-Bryan"]

[output.html]

[output.linkcheck]  # enable the "mdbook-linkcheck" renderer

$ mdbook build
2018-10-20 13:57:51 [INFO] (mdbook::book): Book building has started
2018-10-20 13:57:51 [INFO] (mdbook::book): Running the html backend
2018-10-20 13:57:53 [INFO] (mdbook::book): Running the linkcheck backend
```

**shell**

```shell
$ cargo install mdbook-linkcheck
$ edit book.toml && cat book.toml
[book]
title = "My Awesome Book"
authors = ["Michael-F-Bryan"]

[output.html]

[output.linkcheck]  # enable the "mdbook-linkcheck" renderer

$ mdbook build
2018-10-20 13:57:51 [INFO] (mdbook::book): Book building has started
2018-10-20 13:57:51 [INFO] (mdbook::book): Running the html backend
2018-10-20 13:57:53 [INFO] (mdbook::book): Running the linkcheck backend
```

**bash**

```bash
$ cargo install mdbook-linkcheck
$ edit book.toml && cat book.toml
[book]
title = "My Awesome Book"
authors = ["Michael-F-Bryan"]

[output.html]

[output.linkcheck]  # enable the "mdbook-linkcheck" renderer

$ mdbook build
2018-10-20 13:57:51 [INFO] (mdbook::book): Book building has started
2018-10-20 13:57:51 [INFO] (mdbook::book): Running the html backend
2018-10-20 13:57:53 [INFO] (mdbook::book): Running the linkcheck backend
```

**console**

Note unlike the shell styles above, everything after a `$` or `>` entry is all _one color_ (which is nice if you don't want t apply shell highlighting to something that is probably be plain text). 

And it also separates output nicely in a different color to the input.

```console
$ ncu
Checking package.json
[====================] 5/5 100%

 express           4.12.x  →   4.13.x
 multer            ^0.1.8  →   ^1.0.1
```
 
```console
> ncu
Checking package.json
[====================] 5/5 100%

 express           4.12.x  →   4.13.x
 multer            ^0.1.8  →   ^1.0.1
```
 
This also works well if you have multiple commands and you want to alternative between input and output clearly.

```console
$ cargo install mdbook-linkcheck
$ edit book.toml && cat book.toml
[book]
title = "My Awesome Book"
authors = ["Michael-F-Bryan"]

[output.html]

[output.linkcheck]  # enable the "mdbook-linkcheck" renderer

$ mdbook build
2018-10-20 13:57:51 [INFO] (mdbook::book): Book building has started
2018-10-20 13:57:51 [INFO] (mdbook::book): Running the html backend
2018-10-20 13:57:53 [INFO] (mdbook::book): Running the linkcheck backend
```

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
