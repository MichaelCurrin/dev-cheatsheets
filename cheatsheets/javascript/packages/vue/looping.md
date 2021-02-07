# Looping

{% raw %}

```html
<li v-for="item in items" :key="item.id">
  {{ item }}
</li>
```

Enumerate value and index in an array.

```html
<li v-for="(item, index) in items">...
```

Unpack key-value pairs of an associative array.

```html
<li v-for="(value, key) in myObj">...
```

Use `v-for` with a component.

```html
<my-foo v-for="item in foo"
  :foo="item"
  :key="item.id">
```

{% endraw %}
