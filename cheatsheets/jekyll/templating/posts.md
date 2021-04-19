# Posts


## Categories
> How to set categories on a post

You can use either `category` or `categories`. Both get evaluated by Jekyll as a category and made available on `page.categories`.

### Set category field

Using `category` only accepts a single value.

- `_posts/2021-01-02-abc.md`
    ```liquid
    ---
    category: foo
    ---
    ```

### Set categories field

Using `categories` lets you use specifiy multiple values.

Either by using spaces between words in a string - this is normally just a single string in YAML but Jekyll does magic to convert to a array.

- `_posts/2021-01-02-abc.md`
    ```liquid
    ---
    categories: foo bar bazz-buzz
    ---
    ```

Or using an array. 

- `_posts/2021-01-02-abc.md`
    ```liquid
    ---
    categories:
      - foo
      - bar
      - bazz-buzz
    ---
    ```
    
The resulting path will be:

- `foo/bar/bazz-buzz/2021/01/02/abc.html`

Do not use quotes. 

Use a dash for multi-word categories - e.g. `bazz-buzz`. If you used space in the array form above, then your output path has a space in, which is not good - rather use a dash.

### Put posts directory in a directory

Here using a directory `foo` which contains `_posts` directory.

- `foo/_posts/2021-01-02-abc.md`
    ```liquid
    ---
    ---
    ```

Resulting categories:

```json
["foo"]
```

Resulting path:

- `foo/bar/2021/01/02/abc.html`

Here use the outer directory and the frontmatter categories together.

- `foo/_posts/2021-01-02-abc.md`
    ```liquid
    ---
    categories: bar
    ---
    ```

Resulting categories:

```json
["foo", "bar"]
```

### Put a directory inside the posts directory

You could even a directory _inside_ of `_posts`.

But this would only be for your own structure convenience. Using `_posts/foo` below does **not** affect the categories variable or the output path.

- `_posts/foo/2021-01-02-abc.md`
    ```liquid
    categories: bar
    ```

Resulting categories:

```json
["bar"]
```

Output path:

- `bar/2021/01/02/abc.html`
