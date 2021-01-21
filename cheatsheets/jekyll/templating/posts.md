# Posts


## Categories
> How to set categories on a post

### Set category field

Single value in `category`.

- `_posts/2021-01-02-abc.md`
    ```liquid
    ---
    category: foo
    ---
    ```

### Set categories field

Space-separated in `categories`.

- `_posts/2021-01-02-abc.md`
    ```liquid
    ---
    categories: foo bar bazz-buzz

    # Or
    categories:
      - foo
      - bar
      - bazz-buzz
    ---
    ```
- Output path: `foo/bar/bazz-buzz/2021/01/02/abc.html`

Do not use quotes. You can use a space in the multi-line array but then your output path has a space which is not good - rather use a hyphen.

### Use a directory

- `foo/_posts/2021-01-02-abc.md`
    ```liquid
    categories: bar
    ```

The outer directory gets added to categories.

Resulting categories:

```json
["foo", "bar"]
```

Resulting path:

- `foo/bar/2021/01/02/abc.html`

Or you can do a directory inside `_posts`.

- `_posts/foo/2021-01-02-abc.md`
    ```liquid
    categories: bar
    ```

The inner path does **not** affect categories variable.

Resulting categories:

```json
["bar"]
```

Output path:

- `bar/2021/01/02/abc.html`
