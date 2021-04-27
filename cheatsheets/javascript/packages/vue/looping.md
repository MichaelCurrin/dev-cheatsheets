# Looping

{% raw %}

## Basic

Be sure to provide a key, to avoid getting an error.

In this case, each item is a hash with a `url` attribute.

```html
<ul>
  <li v-for="item in items" :key="item.id">
    <p>{{ item }}</p>
    
    <p>{{ item.name }}</p>
    
    <a href="item.url">Link</a>
  </li>
</ul>
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
