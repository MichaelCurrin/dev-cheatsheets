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

A block scalar is similar to a string. The value starts on its own line, indented. The value is escaped, so you can use quotes and symbols easily without having to escape them.

They are especially useful for multi-line strings, but also work fine for single-line strings.

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

There are a few characters to change how the block scalar is handled. See sections below or or see [yaml-multiline.info](https://yaml-multiline.info/) for more info and an updating demo.

### Set block style

Change newline behavior.

#### Literal newlines

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

#### Fold newlines

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
