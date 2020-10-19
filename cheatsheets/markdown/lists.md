# Lists


## Bulleted list

### Basic

The hyphen is preferred.

    - Bulleted
    - List

- Bulleted
- List

### Nested

The convention hyphen on the outside, then a star within that and a plus sign within that. Though this doesn't actually effect the result.

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

### Multi-line text

You can use line breaks in a bullet list (but not a numbered list).

    - First point starts here.

        Next line of same point.

        And a third line.
    - Second point starts here.

        And keeps going here.

- First point starts here.

    Next line of same point.

    And a third line.
- Second point starts here.

    And keeps going here.


## Numbered list

    1. Numbered
    2. List

1. Numbered
2. List

Note that numbering can be left as all `1.` and it will still work.

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


## Mixed list

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


## Quotes in lists

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


## Code blocks in lists

### Basic

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

### Multi-line

    - Here is some code, indented so it shows under the point.
        ```python
        print("Hello, world!")
        ```
    More text in the same point.
        ```python
        print("Hello again, world!")
        ```
    - Bar.

- Here is some code, indented so it shows under the point.
    ```python
    print("Hello, world!")
    ```
    More text in the same point.
    ```python
    print("Hello again, world!")
    ```
- Bar.
