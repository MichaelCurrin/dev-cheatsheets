# Collections

{% raw %}


## Iterate over collection

- `_config.yml`
    ```yaml
    collections:
    foo:
        output: true
    ```
- `_foo/bars/*.md`
- `index.md`
    ```liquid
    ---
    ---
    {% for item in site.foo.bars %}
        {{ item.title }}
    {% endfor %}
    ```

{% endraw %}
