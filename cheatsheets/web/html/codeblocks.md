# Codeblocks

## Pre

Preformatted

i.e. preserve whitespace

No `br` tags needed.

```html
<pre>Hello
World!</pre>
```

<pre>Hello
World!</pre>


## Code

Display code, using monospace. No syntax highlighting will be used. 

```html
<code>
  console.log("Hello, World!");
</code>
```

<code>
  console.log("Hello, World!");
</code>

You probably want to use `pre` as well to preserve whitespace. Just remember to take out the whitespace around the `code` tags to avoid rendering those.

```html
<pre><code>console.log("Hello, World!");</code></pre>

<pre><code>console.log("Hello, World!");
console.log("Line 2")</code></pre>
```

<pre><code>console.log("Hello, World!");</code></pre>

<pre><code>console.log("Hello, World!");
console.log("Line 2")</code></pre>

You can use a library for syntax highlighting, or use GitHub Markdown with backtick codeblocks

    ```html
    <p>Hello, World!</p>
    ```


## Samp

Sample output from a computer. It will be using monospace.

```html
<samp>
  Hello, World!
</samp>
```

<samp>
  Hello, World!
</samp>
