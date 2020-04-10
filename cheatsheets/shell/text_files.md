# Working with text files cheatsheet


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
eyJoaXN0b3J5IjpbMzgxMzI0NzNdfQ==
-->