# Binding

See [v-bind](https://vuejs.org/v2/api/#v-bind) in the docs.

## Text

Pass plain text string.

```html
<a href="https://example.com">...</a>
```

```html
<input type="textarea" />
```


## JS

Pass a JS expression. The second form is the same but shorter.

```
v-bind:VARNAME="EXPRESSION"

:VARNAME="EXPRESSION"
```

e.g. Variable `url` set on `data`.

```html
<a v-bind:href="url">...</a>
<a :href="url">...</a>
```

e.g. Function call.

```html
<a :href="my_var.toLowerCase()">...</a>
```


A literal value like a number or boolean.

```html
<input :foo="123" />
<input :foo="false" />
```

Note that even though this looks like a number, without v-bind this is just a string.

```html
<input foo="123" />
```


## Boolean

You can pass custom attributes. This value will be `true`

```html
<input isRequired />
```

Here is an equivalent as JS expression. Note use of v-bind to pass a boolean of `true` and not a string that says `"true"`.

```html
<input :isRequired="true" />
```

Note that plain HTML already supports booleans. Like either of these. But the value of `true` will probably just be a string if you try and use it for Vue purposes and not plain HTML purposes.

```html
<input required />

<input required="true"/>
```


## Style

```html
<span :style="{ marginLeft: '.5em' }"></span>
```
