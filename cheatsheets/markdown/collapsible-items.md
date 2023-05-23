# Collapsible items

In Markdown, how to create _sections_ which can expand and collapse again, like an accordion.


## Format

Here we use the `details` and `summary` HTML5 tags as HTML in Markdown, which works GitHub. No JavaScript or CSS needed.


**Markdown code:**

```html
<details>
<summary>TITLE</summary>

BODY CONTENT

</details>
```

**Result:**

<details>
<summary>TITLE</summary>

BODY CONTENT

</details>


## Markdown and HTML

HTML code is also valid in Markdown documents, since everything gets converted to HTML when viewed.

Here we use HTML in the title of the accordion and Markdown in the body.

**Markdown code:**

```markdown
<details>
<summary><b>Preview title</b></summary>

_Markdown is valid, but add empty lines to separate from the HTML tags._

- Bullet
- Points

</details>
```

**Result:**

<details>
<summary><b>Preview title</b></summary>

_Markdown is valid, but add empty lines to separate from the HTML tags._

- Bullet
- Points

</details>


## Jekyll site

Example of writing Liquid code inside an accordion, when using the [Jekyll][] static site generator.

Here we put a codeblock inside the expandable section, to show how to combine HTML and Liquid. Since is needed in particular for putting codeblocks inside HTML, since using trick backticks or indentation just gets shown literally and not converted to Markdown.

[Jekyll]: {% link cheatsheets/jekyll/index.md %}

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

**Sample rendered HTML**

Using the code above in a Jekyll site, here is the result after building to plain HTML:

<details>
<summary>Preview</summary>
<figure class="highlight">
<pre><code class="language-ruby" data-lang="ruby">
<span class="nb">puts</span> <span class="s1">'Expanded message'</span>
</code></pre>
</figure>
</details>

<br>

If you want to see the HTML code that was generated, here it is. For readability, the output was wrapped.

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
