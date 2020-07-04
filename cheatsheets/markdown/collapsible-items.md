---
title: Collapsible items
---

How to create sections which can expand and collapse again.

Use the `details` and `summary` HTML tags in markdown on Github, without any additional CSS.

Format:

    <details>
    <summary>TITLE</summary>

    BODY CONTENT

    </details>


See example below, which uses the bold tag in the titl

**HTML code:**

    <details>
    <summary><b>Preview title</b></summary>

    _Note that markdown is valid but you need empty lines to separate from the HTML tags._

    - Bullet
    - Points.

    ```json
    {
        "odeblock": "emo"
    }
    ```

    </details>

**Result:**

<details>
<summary><b>Preview e</b></summary>

_Note that markdown is valid but you need empty lines to separate from the HTML tags._

- Bullet
- Points.

```json
{
"codeblock": "demo"
}
```

</details>


## Jekyll

Example using Jekyll templating. In particular, putting a code block inside the expandable section.

**Sample Jekyll/Liquid code**

Here is the code:

```
<details>
<summary>
</summary>

{% highlight ruby %}
puts 'E
{% endhighlight %}

</details>
```

**Sample rendered HTML as codesult**

_Using the code above in a Jekyll site, here is the result after building to plain HTML._ndered result.

<details>
<summary>
Preview
</summary>

<figure class="highlight">
    <pre>
        <code class="language-ruby" data-lang="ruby">
        <span class="nb">puts</span> <span class="s1">'Expanded message'</span>
        </code>
    </pre>
</figure>

</details>

<br>

**Sample HTML for displayingoutput**

_Here is the rendered result above shown in a code block below, for clarity. The only change was wrapping, for readability._


```html
<details>
<summary>
Preview
</summary>

<figure class="highlight">
    <pre>
        <code class="language-ruby" data-lang="ruby">
        <span class="nb">puts</span> <span class="s1">'Expanded message'</span>
        </code>
    </pre>
</figure>
```


**Note**

To explain the approach here - if you want to use Jekyll templating, markdown does **not** get picked up here correctly. So if you want a code block in your expanded block, you need to use HTML or the `highlight` Liquid tag. Whether using triple backticks or indentation for a code block inside the details tag, those just end up being used literally.
