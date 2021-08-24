# Codeblocks

## Pre

Preformatted

i.e. preserve whitespace

No `br` tags needed.

**Code**

```html
<pre>Hello
World!</pre>
```

**Result**

<pre>Hello
World!</pre>


## Code

Display code, using monospace. No syntax highlighting will be used. 

**Code**

```html
<code>
  console.log("Hello, World!");
</code>
```

**Result**

<code>
  console.log("Hello, World!");
</code>

You probably want to use `pre` as well to preserve whitespace. Just remember to take out the whitespace around the `code` tags to avoid rendering those.

---

**Code**

```html
<pre><code>console.log("Hello, World!");</code></pre>

<pre><code>console.log("Hello, World!");
console.log("Line 2")</code></pre>
```

**Result**

<pre><code>console.log("Hello, World!");</code></pre>

<pre><code>console.log("Hello, World!");
console.log("Line 2")</code></pre>

You can use a library for syntax highlighting, or use Markdown with backtick codeblocks.

**Code**

    ```html
    <p>Hello, World!</p>
    ```


## Samp

Sample output from a computer. It will be using monospace.

**Code**

```html
<samp>
  Hello, World!
</samp>
```

**Result**

<samp>
  Hello, World!
</samp>
