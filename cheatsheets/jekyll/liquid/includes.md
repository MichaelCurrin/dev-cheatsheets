# Includes

Put code into an _includes_ file so you can use it on pages or layouts. This can be called like a function - especially useful for large pieces of code or for making code reusable. 

You can write is a Markdown or HTML file and can include Liquid syntax in it.

{% raw %}

## Basic

- `_includes/foo.md`
    ```markdown
    This is an example of using **includes** in Jekyll.
    ```
- `page.md`
    ```markdown
    ---
    title: My page
    ---
    {% include foo.md %}
    ```

## Parametrize

You can pass values to it like a function. This could be a value directyl, or a variable like a string, or a variable as an object with attributes on it.

Or you can reference other values like on the page or config or data files.

- `_includes/foo.md`
    ```markdown
    This blog is called {{ site.name }} and was written by {{ include.name }}.
    ```
- `page.md`
    ```markdown
    ---
    title: My page
    fizz: Buzz
    ---
    {% include foo.md name='Foo bar' %}

    {% include foo.md name=page.fizz %}
    ```

Here rendering a bullet list.

- As Markdown `_includes/bullet-list.md`
    ```markdown
    {% for item in include.items %}
    - {{ item }}
    {% endfor %}
    ```
- As HTML `_includes/bullet-list.html`
    ```html
    <ul>
      {% for item in include.items %}
        <li>{{ item }}</li>
      {% endfor %}
    </ul>
    ```

Sample page:

- `page.md`
    ```markdown
    ---
    title: My page
    fruits:
      - Apple
      - Banana
      - Cherry
      - Data
    ---
    
    <h2>My Favorite Fruits</h2>
    
    {% include bullet-list.md items=page.fruits %}
    ```

## Image example

From the [docs](https://jekyllrb.com/docs/includes/).

- `_include/image.html`
    ```liquid
    <figure>
       <a href="{{ include.url }}">
       <img src="{{ include.file }}" style="max-width: {{ include.max-width }};"
          alt="{{ include.alt }}"/>
       </a>
       <figcaption>{{ include.caption }}</figcaption>
    </figure>
    ```

Call it like this:

- `page.md`
    ```liquid
    ---
    title: My page
    ---
    {% include image.html
      url="http://jekyllrb.com"
      max-width="200px"
      file="logo.png"
      alt="Jekyll logo"
      caption="This is the Jekyll logo."
    %}
    ```

{% endraw %}
