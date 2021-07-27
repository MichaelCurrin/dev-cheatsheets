---
title: Lists
description: Bullet points and numbered lists
---


## Bulleted list

### Basic

The hyphen is preferred.

Code:

    - First item.
    - Second item.

Result:

- First item.
- Second item.

### Nested

The convention hyphen on the outside, then a star within that and a plus sign within that. Though this doesn't actually effect the result.

Code:

    - Nested
        * Bullet
            + List
    - Nested
        - Bullet
            - List

Result:

- Nested
    * Bullet
        + List
- Nested
    - Bullet
        - List

### Multi-line text

You can use line breaks in a bullet list (but not a numbered list).

Code:

    - First point starts here.

        Next line of same point.

        And a third line.
    - Second point starts here.

        And keeps going here.

Result:

- First point starts here.

    Next line of same point.

    And a third line.
- Second point starts here.

    And keeps going here.


## Numbered list

Code:

    1. Numbered
    2. List

Result:

1. Numbered
2. List

Note that numbering can be left as all `1.` and it will still work.

Code:

    1. Foo
    1. Bar
    1. Baz

Result:

1. Foo
1. Bar
1. Baz

Note the number formatting style will change by itself at each indentation level.

Code:

    1. Nested
        1. Bullet
            1. List

Result:

1. Nested
    1. Bullet
        1. List


## Mixed list

Code:

    1. Number
    2. Number
        * Bullet
        * Bullet
    3. Number

Result:

1. Number
2. Number
    * Bullet
    * Bullet
3. Number


## Quotes in lists

### Quote under a bullet point

Code:

    - Top-level
        - Point A
            > Indented, so shows **within** the point neatly.

Result:

- Top-level
    - Point A
        > Indented, so shows **within** the point neatly.

### Multi-line quote under a bullet point

Code:

    - Top-level
        - Point A
            > First line.
            > 
            > Next line.

Result:

- Top-level
    - Point A
        > First line.
        > 
        > Next line.

### Quote as a bullet point

Code:

    - Top-level
        - > Point A, which is a quote.

Result:

- Top-level
    - > Point A, which is a quote.

### Bad formatting

Make sure not to mix a quote and bullet at the same level.

Code:

    - Top-level
        - Point A
        > There is no indent here, probably not what you want.
        - Point B

Result:

- Top-level
    - Point A
    > There is no indent here, probably not what you want.
    - Point B


## Code blocks in lists

### Basic

Code:

    - Top-level
        - Foo
        - Here is some code, indented so it shows under the point.
            ```python
            print("Hello, world!")
            ```
        - Bar

Result:

- Top-level
    - Foo
    - Here is some code, indented so it shows under the point.
        ```python
        print("Hello, world!")
        ```
    - Bar

### Multi-line

Code:

    - Here is some code, indented so it shows under the point.
        ```python
        print("Hello, world!")
        ```
    More text in the same point.
        ```python
        print("Hello again, world!")
        ```
    - Bar.

Result:

- Here is some code, indented so it shows under the point.
    ```python
    print("Hello, world!")
    ```
    More text in the same point.
    ```python
    print("Hello again, world!")
    ```
- Bar.


## Tables inside a bullet point

I've discovered this by accident and not seen it in practice, but anyway in case it is useful. Note that standard markdown doesn't support this (like on GitHub), but Jekyll does support it.

### Single row tables

Not that you can't have a table span multiple bullet points. So these are bullet points with one table each.

    - abc | def
    - ghi | jkl
    - first | second | third | fourth

- abc | def
- ghi | jkl
- first | second | third | fourth

### Multi-row table

    - abc | def
      def | ghj

- abc | def
  def | ghj


## Images in lists

Note that HTML gives you more control like resizing the image, but you can use HTML or Markdown for the image.

### Same line

```markdown
- My text <img src="abc.png">
```

### Indent

Add 4 (or 2) spaces to indent an image under a bullet point, without making another bullet point.

As HTML

```markdown
- My text
    <img src="abc.png">
```

This works with text too. At least in a PR description. In GitHub directly, it wraps to one line.

```markdown
- My text
    More text
    Yet more text
        Another level
```

- My text
    More text
    Yet more text
        Another level
