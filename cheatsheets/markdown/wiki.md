## Wiki

Note that if you editing markdown content in a Github, the rules are different for some elements. See this [gist](https://gist.github.com/subfuzion/0d3f19c4f780a7d75ba2).


## Table

The first row is the header and always followed by a row of dashes.

**Code:**

    | A   | B   | C   |
    | --- | --- | --- |
    | Foo | 1   |
    | Bar | 2   |
    | Baz | 3   |

**Result:**Example:

| A   | B   | C   |
| --- | --- | --- |
| Foo | 1   |
| Bar | 2   |
| Baz | 3   |


You can use styling (bold, italics, code, links). Cells with long sentences will wrap automatically.

The output table will set optimal width for each column. So it is optional to keep a cells in a column the same width in markdown. It helps for readability.

Use optional colons for alignment. You can also add a border to the markdown, which does not affect the output. See the following example. [source](https://www.tablesgenerator.com/markdown_tables)


**Code:**

    | Tables   |      Are      |  Cool |
    | -------- | :-----------: | ----: |
    | col 1 is | left-aligned  | $1600 |
    | col 2 is |   centered    |   $12 |
    | col 3 is | right-aligned |    $1 |

**Result:**Example:

| Tables   |      Are      |  Cool |
| -------- | :-----------: | ----: |
| col 1 is | left-aligned  | $1600 |
| col 2 is |   centered    |   $12 |
| col 3 is | right-aligned |    $1 |


Note there are VS Code extension which help with table formatting such as making cells in a column all the same width.

There are also online tools such as [Markdown tables generator](https://www.tablesgenerator.com/markdown_tables).
