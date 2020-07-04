---
title: My title
description: My description
my_list:
    - A
    - B
    - C
my_hash:
    a: 1
    b: 2
    c: 3
deeper_nesting:
    foo: [100, 200, 300]
    bar:
        - 400
        - 500
        - 600
---

---
title: Markdown frontmatter
---

There is a way to show markdown tables where you YAML. You will notice this if you see frontmatter in YAML format at the top of a Jekyll mardown page and view it in GitHub. Adding more fields at the outer level grows the table horizontally.

Note this only seems to work at the **top** of a page.

Code:

- Simple:
    ```yaml
    ---
    title: My title
    description: My description
    ---
    ```
- Complex (see the top of this page)
    ```yaml
    ---
    title: My title
    description: My description
    my_list:
        - A
        - B
        - C
    my_hash:
        a: 1
        b: 2
        c: 3
    deeper_nesting:
        foo: [100, 200, 300]
        bar:
            - 400
            - 500
            - 600
    ---
    ```

For comparison, in a YAML file rather than a markdown file, content would not include the closing `---` and might not have the opening `---`.
