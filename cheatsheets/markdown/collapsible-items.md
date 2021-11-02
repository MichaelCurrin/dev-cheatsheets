# Collapsible items

How to create sections which can expand and collapse again. i.e. an accordion.

Use the `details` and `summary` HTML tags in markdown on GitHub, without any additional CSS.

Format:

```html
<details>
<summary>TITLE</summary>

BODY CONTENT

</details>
```


## Basic

See example below, which uses the bold tag in the title.

**HTML code:**

    <details>
    <summary><b>Preview title</b></summary>

    _Markdown is valid, but add empty lines to separate from the HTML tags._

    - Bullet
    - Points

    ```json
    {
        "codeblock": "demo"
    }
    ```

    </details>

<!-- Result omitted here as Jekyll can't handle it right. Though I can force it to HTML without Jekjyll and then add the result as HTML. -->


## Jekyll

Example using Jekyll templating. In particular, putting a codeblock inside the expandable section.

**Sample Jekyll/Liquid code**

Here is the code:

{% raw %}

```liquid
<details>
<summary>Preview</summary>

{% highlight ruby %}
puts 'Expanded message'
{% endhighlight %}

</details>
```

{% endraw %}

**Sample rendered HTML as codesult**

_Using the code above in a Jekyll site, here is the result after building to plain HTML._ndered result.

<details>
<summary>Preview</summary>

<figure class="highlight">
    <pre>
        <code class="language-ruby" data-lang="ruby">
        <span class="nb">puts</span> <span class="s1">'Expanded message'</span>
        </code>
    </pre>
</figure>

</details>

<br>

**Sample HTML for displaying output**

_Here is the rendered result above shown in a code block below, for clarity. The only change was wrapping, for readability._

```html
<details>
<summary>Preview</summary>

<figure class="highlight">
    <pre>
        <code class="language-ruby" data-lang="ruby">
        <span class="nb">puts</span> <span class="s1">'Expanded message'</span>
        </code>
    </pre>
</figure>
```

**Note**

To explain the approach here - if you want to use Jekyll templating, Markdown does **not** get picked up here correctly. So if you want a codeblock in your expanded block, you need to use HTML or the `highlight` Liquid tag. Whether using triple backticks or indentation for a codeblock inside the details tag, those just end up being used literally.
