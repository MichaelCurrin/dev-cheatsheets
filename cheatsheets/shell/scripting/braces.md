# Braces


## Subshell

This creates subshell, so variables and state is not persisted.

```sh
(cd Documents && ls)
```


## Evaluate

Here getting the result of a command and evaluating it immediately. One case is where you have a command that produces line of environment variables and you want those to be set in the outer scope.

```sh
$(set-creds)
```

Here getting the result of a command and using it in the outer command.

```sh
ls -l $(which deno)

rm $(which deno)
```


## Output Grouping

Usig curly braces to group output. I have rarely seen this. 

```sh
{ EXPRESSION }

{ EXPRESSION } > PATH
```

Note that you need spaces because the braces are reserved words.

It is recommended to use a semicolon between commands if you don't want the expression to stop.

```sh
{ COMMAND ; COMMAND ; COMMAND }
```

### Example 1

From [All about {Curly Braces} in Bash](https://www.linux.com/topic/desktop/all-about-curly-braces-bash/) article.

Here only the output `ls` as the last command gets written.

```sh
echo "I found all these PNGs:"; find . -iname "*.png"; echo "Within this bunch of files:"; ls > PNGs.txt
```

Here it all gets written.

```sh
{ echo "I found all these PNGs:"; find . -iname "*.png"; echo "Within this bunch of files:"; ls; } > PNGs.txt
```

### Example 2

My own testing.

```sh
$ wc -l dump.json
    9444 dump.json
```

```sh
$ { wc -l dump.json ; wc -c dump.json }
    9444 dump.json
 3777324 dump.json
```

I see its use in writing output of multiple commands to a file without having to capture as a variable.

```sh
$ { wc -l dump.json ; wc -c dump.json } > test.txt
$ cat test.txt
    9444 dump.json
 3777324 dump.json
```
