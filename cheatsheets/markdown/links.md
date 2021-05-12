# Links


## Format

A markdown link's format is:


```markdown
[Link text](target)
```

The link text is what will be shown on error or while the image is loading. It can also help with SEO. It can be left blank.

The target should be either a **local** file path in the repo, or a **remote** URL. The target should **not** be blank, otherwise it will just link to the current page.


## File

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

Use a forward slash to indicate a path relative to the **root**, ignoring the current path.

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


## URL

### Inline links

Set the target as a full URL, requiring protocol, domain and optional path.

```markdown
[link text](https://example.com/foo/bar)
```

Regarding protocol - the URL **must** start with `http` or `https`, otherwise the link will in invalid.

For example, this will link add `/example.com` to the current path.

```markdown
[Bad example](example.com)
```

Add optional alternative text. You can hover over the link to see the alt text.

**Code:**

```markdown
[link text](https://example.com "alt text")
```

**Result:**

[link text](https://example.com "alt text")


## Reference-style links

Use text or a number or reference a link in the next paragraph or at the end of the page. 

This helps keep use of links within paragraphs very readable, as you are able to as alias/shortcut to the full link and reuse it across a page. 

The full link will **not** be visible.

### Text alias

Use arbitrary case-insensitive reference text in target. 

And case-sensitive link alias in the link and in the reference. You might prefer dashes and lowercase for predictabilty. The alias is not seen by the end-user.

**Code:**

```markdown
Here is my [Homepage][MichaelCurrin home]

I'm using another link to my site [here][MichaelCurrin home] in case you missed it.

[MichaelCurrin home]: https://michaelcurrin.github.io/
```

**Result:**

Here is my [Homepage][MichaelCurrin home]

I'm using another link to my site [here][MichaelCurrin home] in case you missed it.

[MichaelCurrin home]: https://michaelcurrin.github.io/

### Numbered reference links

Use can use number aliases for your links.

Example:

**Code:**

```markdown
Here is my [Homepage][1] with a numbered reference.

[1]: https://michaelcurrin.github.io/
```

**Result:**

Here is my [Homepage][1] with a numbered reference.

[1]: https://michaelcurrin.github.io/

### Link text

Similar to [Text alias](#text-alias) but using hard brackets with no text. Or not using hard brackets at all. This then takes on the alias from the link text.

Using hard brackets.

**Code:**

```md
Here is my [Homepage][].

And here is my [Homepage][] again.

[Homepage]: https://michaelcurrin.github.io/
```

**Result:**

Here is my [Homepage][].

And here is my [Homepage][] again.

[Homepage]: https://michaelcurrin.github.io/

Leave out hard brackets.

**Code:**

```md
Here is my [Homepage].

And here is my [Homepage] again.

[Homepage]: https://michaelcurrin.github.io/
```

**Result:**

Here is my [Homepage].

And here is my [Homepage] again.

[Homepage]: https://michaelcurrin.github.io/

### Use with Jekyll

This reference style is especially good if your have an internal link that is managed with Jekyll and the `link` tag, which would otherwise make your Markdown source hard to read and edit.

{% raw %}

```md
Go to my [About][] page.

Order a [Fidget Spinner][] from the Products section.

[About]: {% link about.md %}
[Fidget Spinner]: {% links _projects/fidget-spinner.md %}
```

{% end %}
