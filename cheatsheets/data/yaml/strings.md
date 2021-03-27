# Strings


## Scalar

A scalar could by another type but only string is covered here.

Double quotes are recommended - some formatters will convert single quotes to double quotes.

```yaml
my_string: "Hello, world!"
```

Quotes are optional, even for strings with spaces. 

```yaml
my_string: Hello, world!
my_string: Hello "world"
```

Quotes are useful when you have special characters you want to escape. 

For example, a value starting or ending with an asterisk, like a cron schedule below.

```yaml
my_string: "* 0 * * *"
```

Quotes can also prevent a value from being cast to another type.

```yaml
my_string: "True"
my_string: "123"
```

New lines:

```yaml
my_string: "abc\ndef"
```

Escape double quotes with any of:

```yaml
my_string: Hello "world"
my_string: 'Hello "world"'
my_string: "Hello \"world\""
```

Single quotes works the same.


## Block scalars

A block scalar is a variation of a string. 

As an advantage over a plain scalar string, the value gets escaped, so you can use quotes and symbols easily without having to escape them.

They are especially useful for multi-line strings, but also work fine for single-line strings.

The value starts on its own line. All lines of the value must be indented - usually by 2 spaces, but this is inferred so you can actually indent by another count.

Single line:

- YAML
    ```yaml
    my_string: |
      My single line string value.
    ```
- Result:
    ```
    My single line string value.
    ```

Multi-line:

- YAML
    ```yaml
    my_string: |
      My multi-line string value
      continues to another line.
    ```
- Result:
    ```
    My multi-line string value
    continues to another line.
    ```

### Modifiers

There are a few characters to modify how a block scalar is handled. See sections below or or see [yaml-multiline.info](https://yaml-multiline.info/) for more info and an updating demo.

Quick reference:

- Block Scalar Style
    - Replace newlines with spaces (folded)
    - Keep newlines (literal)
- Block Chomping
    - Single newline at end (clip)
    - No newline at end (strip)
    - All newlines from end (keep)
 
See formatting examples below.

#### Block style

Change newline behavior.

##### Literal newlines

Use a pipe (`|`) to interpret newlines literally.

- YAML
    ```yaml
    my_string: |
      Several lines of text,
      with some "quotes" of various 'types',
      and also a blank line:
      
      plus another line at the end.
    ```
- Result
    ```
    Several lines of text,
    with some "quotes" of various 'types',
    and also a blank line:
    
    plus another line at the end.
    ```

##### Fold newlines

Use an arrow (`>`) to fold newlines so they become spaces. To force a newline, use an empty line i.e. two newlines.

- YAML
    ```yaml
    my_string: >
      Several lines of text,
      with some "quotes" of various 'types',
      and also a blank line:
      
      plus another line at the end.
    ```
- Result
    ```
    Several lines of text, with some "quotes" of various 'types', and also a blank line:
    plus another line at the end.
    ```

#### Block chomping

Change what happens to a newline at the end of the entire string. Shown using JSON, as it includes newlines explicitly.

You can use literal or folded block style here.

##### Clip

This is the default. It adds a newline at the end.

- YAML
    ```yaml
    my_string: |
      My text
    ```
- JSON result
    ```json
    "My text\n"
    ```
    
##### Strip

Remove newlines with minus sign (`-`).

- YAML
    ```yaml
    my_string: |-
      My text
    ```
- JSON result
    ```json
    "My text"
    ```

##### Keep

Both of the above ignore existing newlines. To keep them, use a plus sign (`+`).

- YAML
    ```yaml
    my_string: |+
      My text
      
      
    ```
- JSON result
    ```json
    "My text\n\n\n"
    ```
