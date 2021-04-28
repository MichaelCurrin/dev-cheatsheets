---
title: Lists
description: Bullet points and numbered lists
---


## Bulleted list

### Basic

The hyphen is preferred.

    - Bulleted
    - List

- Bulleted
- List

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
