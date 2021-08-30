# Command-line tools on macOS


### Xcode

macOS developer tool.

- [Download Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12) from Apple store.
- [Downloads and resources](https://developer.apple.com/xcode/resources/) section within Xcode on Apple developers site.

CLI:

```sh
$ xcode-select OPTIONS
```

Help:

```
Usage: xcode-select [options]

Print or change the path to the active developer directory. This directory
controls which tools are used for the Xcode command line tools (for example,
xcodebuild) as well as the BSD development commands (such as cc and make).

Options:
  -h, --help                  print this help message and exit
  -p, --print-path            print the path of the active developer directory
  -s <path>, --switch <path>  set the path for the active developer directory
  --install                   open a dialog for installation of the command line developer tools
  -v, --version               print the xcode-select version
  -r, --reset                 reset to the default command line tools path
```


## Command Line Tools

How to update your Command Line Tools (CLT), which work with a version of Xcode.

Update from Software Update in System Preferences.

Or run:

```sh
$ softwareupdate --all --install --force
```

If that doesn't show you any updates, run:

```sh
$ sudo rm -rf /Library/Developer/CommandLineTools
$ sudo xcode-select --install
```

Alternatively, manually download from [here](https://developer.apple.com/download/more/).
  
