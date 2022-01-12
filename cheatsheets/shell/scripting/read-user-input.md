# Read user input

## Related

- [read command][] shell cheatsheet
- [Input][] Python cheatsheet

[read]: {% link cheatsheets/shell/commands/read-write/read.md %}
[Input]: {% link cheatsheets/python/input.md %}


## Get value

```sh
echo -n Password: 
read USER_VALUE
echo

echo $USER_VALUE
```


## Get password

This hides the input from the terminal.

Based on [SO](https://stackoverflow.com/questions/3980668/how-to-get-a-password-from-a-shell-script-without-echoing) discussion.

Some shells can do this in one line:

```sh
read -s -p "Password:" USER_PASSWORD
echo $USER_PASSWORD
```

Otherwise in two lines as `echo -n` and `read`.

```sh
echo -n Password: 
read -s USER_PASSWORD
echo

echo $USER_PASSWORD
```

Some shells won't do `echo -n` so then use `printf`.
