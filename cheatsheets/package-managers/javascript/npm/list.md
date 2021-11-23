# List

List installed packages.


## Usage

### Help

```console
$ npm list -h
npm ls [[<@scope>/]<pkg> ...]
```

### Basic

```sh
$ npm ls
$ npm -g ls
```

Or use an alias.

```sh
$ npm list
```

### Hide errors

Hide error output.

```console
$ npm ls 2> /dev/null | grep glob-parent 
│ │ ├─┬ glob-parent@3.1.0
│ │ │ ├── glob-parent@3.1.0 deduped
│ │ │ │ ├─┬ glob-parent@5.1.2
│ │ │ ├─┬ glob-parent@5.1.2
│ │ ├─┬ glob-parent@5.1.2
```

In this particular project, there were a bunch of peer dependency errors send to stderr which could be hidden.

```console
$ npm ls  | grep glob-parent    
│ │ ├─┬ glob-parent@3.1.0
│ │ │ ├── glob-parent@3.1.0 deduped
npm ERR! peer dep missing: react@^16.9.0, required by @bootstrap-styled/navigation-bar@1.9.6
npm ERR! peer dep missing: react@^16.9.0, required by @bootstrap-styled/v4@3.4.0
npm ERR! peer dep missing: react@^16.10.2, required by bootstrap-styled@2.7.2
npm ERR! peer dep missing: react-dom@^16.9.0, required by @bootstrap-styled/navigation-bar@1.9.6
npm ERR! peer dep missing: react-dom@^16.9.0, required by @bootstrap-styled/v4@3.4.0
npm ERR! peer dep missing: react-dom@^16.10.2, required by bootstrap-styled@2.7.2
npm ERR! peer dep missing: react-redux@^6.0.0, required by connected-react-router@
...
```
