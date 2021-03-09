# Strings


## Basic

Use **single** quotes for literal string - not evaluated. Nothing special needed like in other languages to include multiple lines.

```sh
X='Hello,
world'

echo "$X"
```

Output:
```
Hello,
world
```

Use **double quotes** to evaluate expressions.

```sh
X="Hello,
$(whoami)"

echo "$X"
```

Output:
```
Hello,
mcurrin
```


## Heredoc

See [guide](https://linuxize.com/post/bash-heredoc/).

Bash supports a _heredoc_:

- This lets you create a string which implicitly escapes all single and double quotes, letting you write a clean string. 
- Typically, a heredoc is used for writing multi-line strings, but you don't have it.
- You might use it for a literal string or evaluate expressions.

For most cases, I don't need a heredoc. A standard single or double-quoted string works well - including for multiple lines.

But, the heredoc does have the advantage that you can use single and double quotes inside the string without escaping them, as your string terminator will be `EOF` for example.

Note you can use anything but `EOF` is the common term to start and end the shell heredoc.

### Evaluate

```sh
cat << EOF
```

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

A heredoc allows a multi-line string with evaluation. Without escaping double quotes like `"\"user\": \"$(whoami)\""`.

With a variable (instead of `cat`).

```sh
MY_VAR=$(cat << EOF
{
    "user": "$(whoami)"
}
EOF)

echo "Quoted"
echo "$MY_VAR"
echo "Unquoted"
echo $MY_VAR
```

Result:

```
Quoted
{
    "user": "mcurrin"
}
Unquoted
{ "user": "mcurrin" }
```

Note double quotes on `echo` to keep newlines.


### Literal

Prevent evaluation by using quotes - single or double. 

```sh
cat << "EOF"
EOF
```

Example:

```sh
cat << "EOF"
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

With a variable:

```sh
MY_VAR=$(cat << 'EOF'
{
    "user": "$(whoami)"
}
EOF)

echo "Quoted"
echo "$MY_VAR"
echo "Unquoted"
echo $MY_VAR
```

Result:

```
Quoted
{
    "user": "$(whoami)"
}
Unquoted
{ "user": "$(whoami)" }
```

### Indent

From [guide](https://www.oreilly.com/library/view/bash-cookbook/0596526784/ch03s04.html)

The heredoc becomes more useful than a plain string when you use remove common indentation.

Here we indent the text with **tab** (not spaces) and then use `<<-` to remove tabs (does not remove spaces.

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

Or with a variable.

```sh
VAR=$(cat <<- EOF
	{
		"user": "$(whoami)",
	}
EOF
)

echo "$VAR"
```


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

### Other languages

#### PHP

Using a heredoc in PHP - from the [PHP manual](https://www.php.net/manual/en/language.types.string.php#language.types.string.syntax.heredoc).

```php
$foo = 'abc;
$x = <<<EOT
Line 1
Line 2
'Single quotes' line.
"Double quotes" line.
$foo
EOT;
}
?>
```

#### JavaScript

In JavaScript, you would do use backticks. This will evaulate expressions though.

- `index.js` for JavaScript.
    ```javascript
    foo = 'abc'
    var x = `\
    Line 1
    Line 2
    'Single quotes' line.
    "Double quotes" line.
    ${foo}
    `
    ```
    
#### Python

In Python you would use three quotes. You could use double quotes (`"`) usually, just for convention. You would use an `f` string as below for evaluation.
 
- `app.py` for Python.
    ```python
    x = f"""\
    Line 1
    Line 2
    'Single quotes' line.
    "Double quotes" line.
    {foo}
    """
    ```
