---
title: Frontmatter
---

Jekyll files have frontmatter metadata - it always starts and ends with `---`, followed by any HTML or markdown content. Contrast with YAML file which only have one `---` or none.

- Simple:
    ```yaml
    ---
    title: My title
    description: My description
    ---
    ```
- Complex
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


Comments can be added as:

```yaml
---
title: Title
# Comment
---
```
