# Git attributes file


Optional file for the root of your repo.

> A gitattributes file is a simple text file that gives attributes to pathnames.
>
> Each line in gitattributes file is of form:
> 
> `pattern attr1 attr2 ...`


## Samples

- `.gitattributes`
    ```
    # Treat all files in the repo as binary, with no git magic updating
    # line endings. This produces predictable results in different environments.
    * -text
    ```
    

> If you want to ensure that text files that any contributor introduces to the repository have their line endings normalized, you can set the text attribute to "auto" for all files.

```
*	text=auto
```

> The attributes allow a fine-grained control, how the line endings are converted. Here is an example that will make Git normalize `.txt`, `.vcproj` and `.sh` files, ensure that `.vcproj` files have CRLF and `.sh` files have LF in the working directory, and prevent `.jpg` files from being normalized regardless of their content.

```
*               text=auto
*.txt		text
*.vcproj	text eol=crlf
*.sh		text eol=lf
*.jpg		-text
```

> Note
>
> When `text=auto` conversion is enabled in a cross-platform project using push and pull to a central repository the text files containing CRLFs should be normalized.
    
    
> From a clean working directory:

```sh
$ echo "* text=auto" >.gitattributes
$ git add --renormalize .
$ git status        # Show files that will be normalized
$ git commit -m "Introduce end-of-line normalization"
```


## Resources

- [gitattributes](https://git-scm.com/docs/gitattributes) in the docs.
- [Customizing Git - Git Attributes](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes) article in the docs.
