# Looping

{% raw %}

## Basic

Be sure to provide a key, to avoid getting an error.

```html
<li v-for="item in items" :key="item.id">
  {{ item }}
</li>
```


## Value and index

Enumerate value and index in an array.

```html
<li v-for="(item, index) in items">...
```


## Keys and values

Unpack key-value pairs of an associative array.

```html
<li v-for="(value, key) in myObj">...
```


## Component

Use `v-for` with a component like `MyFoo`.

```html
<MyFoo v-for="item in foo"
  :foo="item"
  :key="item.id">
```

{% endraw %}
