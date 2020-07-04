---
title: Links
---


## Format

A markdown link's format is:


```markdown
[link text](target)

[](target)
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

Use text or a number or reference a link in the next paragraph or at the end of the page. The full link will not be visible.

### Text

Arbitrary case-insensitive reference text in target. Here we have `Foo bar` but you could use `foo-bar` instead. It is not user-facing.

Example:

**Code:**

```markdown
[I'm a reference-style link][Foo bar]

[Foo bar]: https://www.mozilla.org
```

**Result:**

[I'm a reference-style link][Foo bar]

[Foo bar]: https://www.mozilla.org

### Numbered refrence links

Example:

**Code:**

```markdown
[You can use numbers for reference-style link definitions][1]

[1]: http://slashdot.org
```

**Result:**

[You can use numbers for reference-style link definitions][1]

[1]: http://slashdot.org

### Link text

Example:

**Code:**

```markdown
Or leave it empty and use the [link text itself].

[link text itself]: http://www.reddit.com
```

**Result:**

Code:

Or leave it empty and use the [link text itself].

[link text itself]: http://www.reddit.com
