# Remove node_modules

How to delete installed NPM packages you don't want anymore. For macOS / Linux shell.

## Remove from project

Just delete.

```sh
$ rm -rf node_nodules
```


## Clean-up across projects

Run the `npkill` package.

```sh
$ cd ~
$ npx npkill
```

This will provide a terminal GUI view like this:

```
-----                    __   .__.__  .__
-           ____ ______ |  | _|__|  | |  |
------     /    \\____ \|  |/ /  |  | |  |
----      |   |  \  |_> >    <|  |  |_|  |__      releasable space: 0 MB
--        |___|  /   __/|__|_ \__|____/____/      space saved: 0 MB
-------        \/|__|        \/                   searching ⢈⠩

    > select with CURSORS and press SPACE key to delete <                                                                                                           
  /Users/mcurrin/.config/yarn/global/node_modules                                                                                                                   
  /Users/mcurrin/repos/javascript-bundling-quickstarts/quickstarts/browserify/node_modules  
  ...
```

It shows all `node_modules` directories it can find in the current directory and below.

It lets you see the size of directory and you can press the <kbd>Space</kbd> key to delete a selected directory.
