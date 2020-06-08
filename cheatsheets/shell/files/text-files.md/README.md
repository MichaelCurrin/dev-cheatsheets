# Working with text files cheatsheet


## View file

```sh
# Show entire file at once.
cat file.txt

# Page over large file.
< file.txt
view file.txt
vim file.txt

less file.txt

more file.txt
```


## Clipboard

Copy to and paste from clipboard. Especially useful for very large files or when you use SSH with no GUI.


See [StackOverflow answer](https://stackoverflow.com/questions/749544/pipe-to-from-the-clipboard-in-bash-script) for usage and shortcuts.

### Linux

Use `xclip` - see [man page](https://linux.die.net/man/1/xclip).

> xclip [OPTION] [FILE]...
>
> Description
>
> Reads from standard in, or from one or more files, and makes the data available as an X selection for pasting into X applications. Prints current X selection to standard out. 

#### Read

Store value in X selection.

Command output.

```sh
$ COMMAND | xclip
```

Read file.

```sh
$ xclip PATH
```

This lets you paste using the middle mouse button.

If you prefer to traditional pasting:

```sh
$ xclip -sel clip PATH
```

Or according to the manpage:

> -selection 
>
>   specify which X selection to use, options are "primary" to use XA_PRIMARY (default), "secondary" for XA_SECONDARY or "clipboard" for XA_CLIPBOARD 

#### Output

```sh
$ xclip
```

> -o, -out 
>
>   prints the selection to standard out (generally for piping to a file or program) 
    
```sh
$ xclip -o > PATH
```

### macOS

Use `pbcopy` and `pbpaste`.

Copy file.

```sh
$ pbcopy < PATH
```

Print
```sh
$ pbpaste
```

Pipe

```sh
pbpaste | head
```

## Open

```sh
$ open directory_name
```

```sh
$ open file.txt
```

```sh
$ open image.png
```


```sh
$ open http://localhost:5000
```

From the macOS `open` manpage:

```
EXAMPLES
     "open '/Volumes/Macintosh HD/foo.txt'" opens the document in the default application for its type (as determined by LaunchServices).

     "open '/Volumes/Macintosh HD/Applications/'" opens that directory in the Finder.

     "open -a /Applications/TextEdit.app '/Volumes/Macintosh HD/foo.txt'" opens the document in the application specified (in this case, TextEdit).

     "open -b com.apple.TextEdit '/Volumes/Macintosh HD/foo.txt'" opens the document in the application specified (in this case, TextEdit).

     "open -e '/Volumes/Macintosh HD/foo.txt'" opens the document in TextEdit.

     "ls | open -f" writes the output of the 'ls' command to a file in /tmp and opens the file in the default text editor (as determined by LaunchServices).

     "open http://www.apple.com/" opens the URL in the default browser.

     "open 'file://localhost/Volumes/Macintosh HD/foo.txt'" opens the document in the default application for its type (as determined by LaunchServices).

     "open 'file://localhost/Volumes/Macintosh HD/Applications/'" opens that directory in the Finder.

     "open -h NSView" lists headers whose names contain NSView and allows you to choose which ones to open.

     "open -h NSView.h" immediately opens NSView.h.

     "open -h NSView -s OSX10.12" lists headers whose names contain NSView in the MacOSX 10.12 SDK and allows you to choose which ones to open.
```

## Iterate over a file

```sh
for ROW in $(cat requirements.txt)
do
  echo "pip install $ROW"
done
```

From `xargs` manpage:

> The xargs utility reads space, tab, newline and end-of-file delimited strings from the standard input and executes utility with the strings as arguments.


```sh
cat requirements.txt | xargs pip install
```

## Dotenv

Export the vars in `.env` file into your shell:

```sh
export $(< .env) | xargs)
```

Check if it exists first:

```sh
if [ -f .env ]; then
  export $(cat .env | xargs)
fi
```

Ignore comments:

```sh
export $(egrep -v '^#' .env | xargs)
```

[source](https://gist.github.com/judy2k/7656bfe3b322d669ef75364a46327836)
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTc2MDI3Mjk0NF19
-->
