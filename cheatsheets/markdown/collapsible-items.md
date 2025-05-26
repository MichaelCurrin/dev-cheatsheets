# Collapsible items

In Markdown, how to create _sections_ which can expand and collapse again, like an accordion.


## General format

Here we use the `details` and `summary` HTML5 tags as HTML in Markdown, which works on GitHub. No additional JavaScript or CSS needed.

**Markdown code:**

```html
<details>
<summary>TITLE</summary>

BODY CONTENT

</details>
```

<br>

When you click to expand the accordion, the attribute will be added to the outer element as: `<details open="">`

**Result:**

<details>
<summary>TITLE</summary>

BODY CONTENT

</details>

<br>

---

## Markdown and HTML

_Warning: This approach works well in GitHub when it renders Markdown as HTML, but when Jekyll will renders the code it keeps the Markdown as plain text and does not render it as formatted Markdown._

HTML code is  valid in Markdown documents, since everything gets converted to HTML when viewed.

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

<br>

**Result when rendered with GitHub:**

<details>
<summary><b>Preview title</b></summary>
<p data-sourcepos="57:1-57:72" dir="auto"><em>Markdown is valid, but add empty lines to separate from the HTML tags.</em></p>
<ul data-sourcepos="59:1-61:0" dir="auto">
<li data-sourcepos="59:1-59:8">Bullet</li>
<li data-sourcepos="60:1-61:0">Points</li>
</ul>
</details>

<br>

**Result when rendered with Jekyll:**

<details>
<summary><b>Preview title</b></summary>

_Markdown is valid, but add empty lines to separate from the HTML tags._

- Bullet
- Points

</details>

<br>

---

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

<br>

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
