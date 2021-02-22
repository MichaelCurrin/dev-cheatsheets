# Strings


## Basic

Single or multi-line - nothing special needed like in other languages.

```sh
X='Hello,
world'

echo $X
```
Output:
```
Hello,
world
```


Double quotes to evaluate.

```sh
X="Hello,
$(whoami)"

echo $X
```
Output:
```
Hello,
mcurrin
```


## Heredoc

See [guide](https://linuxize.com/post/bash-heredoc/).

Bash supports a _heredoc.

This term appears in other languages like PHP and is a more powerful way of writing a multi-line string. 

Equivalents:

- `index.js`
    ```javascript
    var x = `\
    Line 1
    Line 2
    ${foo}
    `
    ```
- `app.py`
    ```python
    x = f"""\
    Line 1
    Line 2
    {foo}
    """
    ```

In the shell, for most cases I find using single or double quotes for a multi-line string works great. But the heredoc does have the advantage that you can use single and double quotes inside the string without escaping them, as your string terminator will be `EOF` for example. See below.

Note you can use anything but `EOF` is the common term to start and end the shell heredoc.

### Evaluate

`cat << EOF`

Example:

```sh
cat << EOF
Line 1
Line 2
You are $(whoami)
EOF
```

Output:
```
Line 1
Line 2
You are mcurrin
```

Works with `cat` but not `echo`.

You can use anything at the start and end but `EOF` for "end of file" is the convention.

### Literal

Prevent evaluation by using quotes. `cat << "EOF"`

Example:

```sh
cat <<- "EOF"
Line 1
Line 2
You are $(whoami)
EOF
```
Output:
```
Line 1
Line 2
You are $(whoami)
```

### Indent

From [guide](https://www.oreilly.com/library/view/bash-cookbook/0596526784/ch03s04.html)

The heredoc becomes more useful than a plain string when you use remove common indentation.

Here we indent the text with **tab** (not spaces) and also use `<<-`.

```sh
if true; then
		cat <<- EOF
		Line 1
		Line 2
		EOF
fi
```
Output:
```
Line 1
Line 2
```

Note that `EOF` must not be indented.

### Piping

```sh
cat <<'EOF' |  sed 's/l/e/g'
Hello
world
EOF
```
Output:
```
Heeeo
wored
```

Write to file.

```sh
cat <<'EOF' |  sed 's/l/e/g' > file.txt
Hello
world
EOF
```
