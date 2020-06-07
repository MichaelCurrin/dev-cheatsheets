# Check OS


## Display

### OSTYPE variable

```sh
echo $OSTYPE
```

e.g.

OS    | Value
---   | ---
macOS | `darwin19.0`
Linux | `linux-gnu`

### uname command

```sh
$ uname
```
e.g.

Linux | Value
---   | ---
Linux | `Linux`


## Set boolean

Based on Grails quickstart which uses `case` and `uname`.

```sh
IS_MAC=false
IS_LINUX=false

case "$(uname)" in
  Darwin* )
    IS_MAC=true
    ;;
  Linux* )
    IS_LINUX=true
    ;;
esac
```

Example use:

```sh
if [[ $IS_MAC == 'true' ]]; then
  echo 'Hello, macOS!'
fi
```


## Inline control flow

Perform a check inline to produce a string. Note this could be improved by first storing a value.

```sh
$ echo "Hello $([[ "$OSTYPE" == "darwin"* ]] && echo 'Mac')"
```
Result if Mac: `Hello Mac`

Result if not Mac: `Hello`


## Check OS flavor

Linux Lite uses a text file which includes the version.

```sh
IS_LINUX_LITE=$([[ -f /etc/llver ]] && echo 'true' || echo 'false')
```

```sh
if [[ -f /etc/llver ]]; then
  IS_LINUX_LITE=true
else
  IS_LINUX_LITE=false
fi
```

## Release

```sh
$ less /etc/*release
```

Example for Linux Lite 5, which uses Debian and Ubuntu.

- `lsb-release`
    ```
    DISTRIB_ID=Ubuntu
    DISTRIB_RELEASE=20.04
    DISTRIB_CODENAME=focal
    DISTRIB_DESCRIPTION="Linux Lite 5.0"
    ```
- `os-release`
    ```
    NAME="Ubuntu"
    VERSION="20.04 LTS (Focal Fossa)"
    ID=ubuntu
    ID_LIKE=debian
    PRETTY_NAME="Linux Lite 5.0"
    VERSION_ID="20.04"
    HOME_URL="https://www.ubuntu.com/"
    SUPPORT_URL="https://help.ubuntu.com/"
    BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
    PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
    VERSION_CODENAME=focal
    UBUNTU_CODENAME=focal
    ```
    
