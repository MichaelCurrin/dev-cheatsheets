# Strings


## Quote strings

### Evaluation

Use **single quotes** for a literal string one that is not evaluated. 

```sh
X='Hello, $(whoami) / $USER'

echo "$X"
```
```
Hello, Hello, $(whoami) / $USER'
```

Use **double quotes** to evaluate.

```sh
X="Hello, $(whoami) / $USER!"

echo "$X"
```
```
Hello, mcurrin / mcurrin!
```

### Multi-line strings

#### Using enter

Just press enter for a newline, in single or double quotes.

Nothing special is needed like in other languages to include multiple lines.

```sh
X='Hello,
world'

echo "$X"
```
```
Hello,
world
```

#### Using escaped newline character

You can also use `\n` for a newline. But you need to use `-e` flag to evaulate newlines (need in Bash but ZSH doesn't need the flag).

```sh
X="A\nB\nC"
echo -e "$X"
```
```
A
B
C
```

Or using `echo` directly:

```sh
echo "ABC\nDEF\nGHI"
```
```
ABC\nDEF\nGHI
```

With `-e` flag.

```sh
echo -e "ABC\nDEF\nGHI"
```
```
ABC
DEF
GHI
```

Using `printf`:

```sh
printf 'ABC\nDEF\nGHI\n'
```
```
ABC
DEF
GHI
```

Or `print`:

```sh
print 'ABC\nDEF\nGHI'
```
```
ABC
DEF
GHI
```

#### Skip first line.

For indentation reason, you might want to leave text off of the first line. Use the `\` symbol to split your command so you start the string on the next line.

```sh
$ echo \
'First line
Second line'
```
```
First line
second line
```

Note that this does **not** work. It adds a literal backslash. But in JavaScript or Python, this approach works.

```sh
$ echo '\
First line
Second line'
```
```
\
First line
Second line
```

### Escaping quotes

```sh
echo "With 'single' quotes"
echo 'With "double" quotes'

echo 'With \'escaped single\' quotes'
echo "With \"escaped single\" quotes"
```

If you need to use single and double quotes in the same string and don't want to use `\` to escape them, then read on for the heredoc belo.

### Defaults

Set a default value in case a variable is not set.

The syntax here is within `${}` substitution, as `${VARIABLE:-DEFAULT}`.

e.g.

No default - empty string.

```sh
$ Hello, ${NAME}!"'
Hello, !
```

With default fallback:

```sh
$ Hello, ${NAME:-World}!"'
Hello, World!
$ NAME=developer Hello, ${NAME:-World}!"'
Hello, developer!
```


## Heredoc strings

See [guide](https://linuxize.com/post/bash-heredoc/).

Bash supports a _heredoc_:

- This lets you create a string which implicitly escapes all single and double quotes, letting you write a clean string. 
- Typically, a heredoc is used for writing multi-line strings, but you don't have it.
- You might use it for a literal string or evaluate expressions.

For most cases, I don't need a heredoc. A standard single or double-quoted string works well - including for multiple lines.

But, the heredoc does have the advantage that you can use single and double quotes inside the string without escaping them, as your string terminator will be `EOF` for example.

### Syntax

Note you can use anything, but `EOF` is the common term to start and end the shell heredoc.

The last occurence should be on a line of its own, without indentation and without characters after it.

In one situation, I found `EOF)` as the last line was actually valid in my shell, but in a CI flow I got a linting error.

### Evaluate

```sh
cat << EOF
CONTENT
EOF
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

You can use anything at the start and end, but `EOF` for "end of file" is the convention.

A heredoc allows a multi-line string with evaluation. Without having to explicitly escape quotes as `"\"user\": \"$(whoami)\""`.

Storing as a variable and formatting as a JSON string.

```sh
MY_VAR=$(cat << EOF
{
    "user": "$USER"
}
EOF
)

echo "Quoted"
echo "$MY_VAR"
echo "Unquoted"
echo $MY_VAR
```

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
CONTENT
EOF
```

Example:

```sh
cat << "EOF"
Line 1
Line 2
You are $USER
EOF
```
Output:
```
Line 1
Line 2
You are $USE
```

Storing as a variable and formatting as a JSON string.

```sh
MY_VAR=$(cat << 'EOF'
{
    "user": "$USER"
}
EOF
)

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
    foo = 'abc';
    var x = `\
    Line 1
    Line 2
    'Single quotes' line.
    "Double quotes" line.
    ${foo}
    `
    ```

Note use of escaped newline at the start, to prevent first line from appearing as empty.

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

Note use of escaped newline at the start, to prevent first line from appearing as empty.


## Case

From [article](https://linuxhint.com/bash_lowercase_uppercase_strings/).

For Bash 4 and up only. Not Bash 3 or ZSH.

### Titlecase

```s
$ x='abc'

$ echo "${x^}
Abc
```

### Uppercase

```sh
$ x='abc'

$ echo "${x^^}
ABC
```

For Bash 3 - from [answer](https://unix.stackexchange.com/questions/51983/how-to-uppercase-the-command-line-argument).

```sh
$ MY_VALUE="Some string"
$ printf '%s\n' "$MY_VALUE" | awk '{ print toupper($0) }'
SOME STRING
```

### Selective uppercase

Here we uppercase only `p` and `j` letters.

```sh
$ LANGUAGES='python perl java php c#'
$ echo ${LANGUAGES^^[p,j]}
```

### Handle inputs

Apply titlecase to an input. e.g. `yes` becomes `Yes`.

```
read -p "Do you like music? " ans
answer=${ans^}
echo "Your answer is $answer."
```
