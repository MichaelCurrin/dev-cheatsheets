# v-html

{% raw %}

## About

> Updates the element's `innerHTML`. 
> 
> Note that the contents are inserted as plain HTML - they will not be compiled as Vue templates. 
> 
> If you find yourself trying to compose templates using `v-html`, try to rethink the solution by using components instead.

> Dynamically rendering arbitrary HTML on your website can be **very dangerous** because it can easily lead to XSS attacks. Only use `v-html` on trusted content and never on user-provided content.


## Syntax

```html
<div v-html="abc"></div>
```

Plain approach.

```html
<div>
  {{ abc }}  
</div>
```

{% endraw %}
