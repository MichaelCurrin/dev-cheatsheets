# Tables


## Recommended

Note there are VS Code extension which help with table formatting such as making cells in a column all the same width.

There are also online tools such as [Markdown tables generator](https://www.tablesgenerator.com/markdown_tables).


## Headers and no headers

### With header

Here we have first row as the header and followed by a row of triple dashes.

    Name | Description
    ---  | ---
    abc  | def
    ghi  | jkl
    ABC  | DEF

Name | Description
---  | ---
abc  | def
ghi  | jkl
ABC  | DEF

### No header

Here we leave off the header or field names and use data rows only.

    abc | def
    ghi | jkl
    ABC | DEF

abc | def
ghi | jkl
ABC | DEF


## Mixed column count

The number of columns for row will be determined by the longest row.

    abc | def
    ghi | jkl
    ABC | DEF | XYZ

abc | def
ghi | jkl
ABC | DEF | XYZ


## Borders vs no borders

These two examples give equivalent output.

### No borders style

**Code:**

    A   | B   | C   
    --- | --- | --- 
    Foo | 1   |
    Bar | 2   |
    Baz | 3   |

**Result**:

A   | B   | C   
--- | --- | --- 
Foo | 1   |
Bar | 2   |
Baz | 3   |

### With borders style

**Code:**

    | A   | B   | C   |
    | --- | --- | --- |
    | Foo | 1   |     |
    | Bar | 2   |     |
    | Baz | 3   |     |

**Result**:

| A   | B   | C   |
| --- | --- | --- |
| Foo | 1   |     |
| Bar | 2   |     |
| Baz | 3   |     |


## Alignment

The output table will set optimal width for each column. So it is optional to keep a cells in a column the same width in markdown. It helps for readability.

Use optional colons for alignment. You can also add a border to the markdown, which does not affect the output. See the following example. [source](https://www.tablesgenerator.com/markdown_tables)

**Code:**

    | Tables   |      Are      |  Cool |
    | -------- | :-----------: | ----: |
    | col 1 is | left-aligned  | $1600 |
    | col 2 is |   centered    |   $12 |
    | col 3 is | right-aligned |    $1 |

**Result:**

| Tables   |      Are      |  Cool |
| -------- | :-----------: | ----: |
| col 1 is | left-aligned  | $1600 |
| col 2 is |   centered    |   $12 |
| col 3 is | right-aligned |    $1 |


## Markdown in cells

You can use styling (bold, italics, code, links). 

    Name       | Description
    ---        | ---
    **abc**    | _def_
    <b>abc</b> | <i>def</i>
    ghi        | [jkl](#)
    ABC        | `DEF`

Name       | Description
---        | ---
**abc**    | _def_
<b>abc</b> | <i>def</i>
ghi        | [jkl](#)
ABC        | `DEF`


## Breaks

Cells with long sentences will wrap automatically. You can force a break though with the HTML `br` tag.

    Name     | Description
    ---      | ---
    abc      | def<br>ghi

Name     | Description
---      | ---
abc      | def<br>ghi
