# Strings


## Scalar

A scalar could by another type but only string is covered here.

### Quotes

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

### Escaping quotes

Escape double quotes with any of:

```yaml
my_string: Hello "world"
my_string: 'Hello "world"'
my_string: "Hello \"world\""
```

Single quotes works the same.

### Scalar limations

You cannot use a colon as you'll get an error.

```yaml
# Error!
my_string: abc : def
```

A hash will be interpreted as a comment.
      
```yaml
my_string: abc # def
```

If you want to use those characters literally, escape them with quotes.

```yaml
my_string: "abc : def"
my_string: "abc # def"
```

Don't use a backlash to escape - this doesn't solve the error for the colon and ends up as a literal backslash for a comment.

Or use [Block scalars](#block-scalars) as below, so the characters all become literal characters.

### Newlines

A newline character works differently depending quoting.

Here with quotes it gets interpeted, as in other languages.

- YAML:
    ```yaml
    my_string: "Abc\ndef"
    ```
- Result:
    ```
    Abc
    def
    ```
    
Without quotes it appears literally.

- YAML:
    ```yaml
    my_string: Abc\ndef
    ```
- Result:
    ```
    Abc\ndef
    ```

You can use implicit newlines in your scalar. But I would recommend against this - rather use [Block scalars](#block-scalars).

```yaml
# Unquoted

my_string: Abc
  def

quotes_escaped: See
  quotes used "here" without escaping
  
newline_escaped: See
  the newline \n doesn't do anything and is literal.
  
# Quoted

my_string: "Abc
  def"
  
quotes_escaped: "See
  some \"escaped quotes\" here." 
  
newline_escaped: "See
  a literal newline here as \\n"
```


## Block scalars

A block scalar is a variation of a string. 

As an advantage over a plain scalar string, the value gets escaped, so you can use quotes and symbols easily without having to escape them.

They are especially useful for multi-line strings, but also work fine for single-line strings.

The value starts on its own line. 

All lines of the value must be indented - usually by 2 spaces, but this is inferred so you can actually indent by another count. The indentation gets removed in the result.

### Basic examples

Single line:

- YAML:
    ```yaml
    my_string: |
      My single line string value.
    ```
- Result:
    ```
    My single line string value.
    ```

Using special characters:

- YAML:
    ```yaml
    my_string: |
      abc : def
      ghi # jkl
    ```
- Result:
    ```
    abc : def
    ghi # jkl
    ```

Multi-line:

- YAML:
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
