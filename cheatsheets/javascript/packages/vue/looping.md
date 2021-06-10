# Looping

{% raw %}


## Basic

Iterate over an array of items, such as set in `data` or maybe as a param.

Be sure to provide a _key_, to avoid getting an error.

In this case, making a bullet list where each item is a hash with a `name` and `url` attribute.

```html
<ul>
  <li v-for="item in items" :key="item.id">   
    <p>{{ item.name }}</p>
    
    <a href="item.url">Link</a>
  </li>
</ul>
```

Using an accordion feature that is built-in to HTML - no CSS needed.

```html
<details v-for="faq in faqs" :key="faq.id">
  <summary>
    <b>{{ faq.question }}</b>
  </summary>

  {{ faq.answer }}
</details>
```


## Value and index

Enumerate value and index in an array.

```html
<li v-for="(item, index) in items">
  ...
</li>
```


## Keys and values

Unpack key-value pairs of an associative array.

```html
<li v-for="(value, key) in myObj">
  ...
</li>
```


## Component

Use `v-for` with a component such as `MyFoo`.

```html
<MyFoo v-for="item in foo"
  :foo="item"
  :key="item.id">
</MyFoo>
```

{% endraw %}
