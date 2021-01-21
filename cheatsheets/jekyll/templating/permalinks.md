# Permalinks

{% raw %}

See [Jekyll Permalinks doc](https://jekyllrb.com/docs/permalinks/).

> Permalinks are the output path for your pages, posts, or collections. They allow you to structure the directories of your source code different from the directories in your output.


## Index pages

Regardless of using the default or `pretty` setting, the page `foo/index.md` will become `/foo/index.html`.

Then a browser will find it using `/foo/`. That is also the preferred format for linking to pages.

You'll get the forward slash in your link to a page using the link tag - `{% link foo/index.md %}`.

If you `README.md` - that will render as `README.html`. So rather use `index.md` files. Or use a `README.md` with permalink set to make it as `/`.


## How to set on one page

Override the permalink on a page in the frontmatter.

```
permalink: URL
```

Warning: When setting on page, you must set a **static value** with no attributes in it. If you use a dynamica value like `/:title/`, you output filename literally be `:title` If you want to use dynamic values, set in the config rather.

Examples:

- `about.html`
    ```liquid
    ---
    permalink: /about/
    ---
    ```
- `404.html` (if your global pattern adds a forwardslash, you can remove it on a specific case.
    ```liquid
    ---
    permalink: /404.html
    ---
    ```


## Set permalink in the config

You are allowed to use dynamic variables here - see the [Placeholders](#placeholders) section.

### Pages and posts

- `_config.yml`
    ```yaml
    permalink: PATTERN
    ```

### Collections

- `_config.yml`
    ```yaml
    collections:
      my_collection:
        output: true
        permalink: /:collection/:name
    ```


## Patterns
> How to build a permalink pattern using placeholders

### Default

Here is Jekyll's default value:

```yaml
permalink: /:categories/:year/:month/:day/:title:output_ext
```

### Built in patterns

Example usage:

- `_config.yml`
    ```yaml
    permalink: pretty
    ```

Using `pretty` will turn `/foo/bar.html` to `/foo/bar`.

From [Built in formats](https://jekyllrb.com/docs/permalinks/#built-in-formats) in the docs.

| Shortcut   | Pattern                                                  |
| ---------- | -------------------------------------------------------- |
| `date`     | `/:categories/:year/:month/:day/:title:output_ext`       |
| `pretty`   | `/:categories/:year/:month/:day/:title/`                 |
| `ordinal`  | `/:categories/:year/:y_day/:title:output_ext`            |
| `weekdate` | `/:categories/:year/W:week/:short_day/:title:output_ext` |
| `none`     | `/:categories/:title:output_ext`                         |


### Custom

Here we have use a forward
Note: Make sure not to remove categories and year/month/day in some way, otherwise your posts will not work. If you do not have posts, that is okay.

Example of a

```yaml
permalink: /:title/
```


## Placeholders

These are the values you can use in a permalink pattern. See the docs for more info.

Note that you need just one pattern for `permalink` that covers attributes for pages and for posts. Then any attributes not appropriate for a given page will be ignored.

### Page attributes

I can't really see the point of setting this for pages.

I found all of these gave identical results:

- `/`
- `/:title`
- `/:basename`
- `/:path`
- `/:output_ext` - this should have broken the site but did nothing.

What did make a difference was adding a trailing forward slash to any one of those. e.g.

- `/:title/`

Here are definitions based on the docs:

| Variable                | Value                                                                                                                                                                                                                                                            |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `:path`                 | Page's directory.                                                                                                                                                                                                                                                |
| `:basename` or `:title` | The page's basename. The docs cover `:basename` though `:title` is used in practice as it works for posts and pages. If you set `permalink: /:title/` then your output paths will be like: `/`, `/foo` and `/foo/bar/`. You don't need to worry about directory. |
| `:output_ext`           | Extension of the output file.                                                                                                                                                                                                                                    |  |

### Post attributes

Here are a few of the many post attribuutes.

| Variable      | Value |
| ------------- | ----- |
| `:year`       |       |
| `:title`      |       |
| `:date`       |       |
| `:categories` |       |

{% endraw %}
