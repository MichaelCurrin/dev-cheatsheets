# Image caption


{% raw %}

## Includes file

```liquid
<figure>
    <img src="{{ include.src }}"
         alt="{{ include.alt }}"
         style="{{ include.style }}"
         class="img-responsive"
    >
    <figcaption>
        {{ include.caption }}
    </figcaption>
</figure>
```

Altenate caption:

```liquid
<figcaption>
    <sub>
        <i>
            {{ include.caption }}
        </i>
    </sub>
</figcaption>
```


## Usage

Then all you need to do use is one line:

```liquid
{% include image.html src="abc.png" alt="Logo" caption="My caption here" %}
```

Or pass a variable from `assign` or from frontmatter.

```liquid
{% assign img_src="abc.png" %}
{% assign caption="My caption here" %}

{% include image.html src=img_src alt="Logo" caption=caption %}
```

And if you want to set style overrides:

```liquid
{% include image.html 
    src="abc.png" 
    alt="Logo"
    caption="My caption here"
    style="float: right; height: 65%; width: 65%"
%}
```


{% endraw %}
