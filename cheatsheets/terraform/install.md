# Install

From the TF docs [Install](https://learn.hashicorp.com/tutorials/terraform/install-cli) page.

## System

### Homebrew on macOS

#### Plain

This approach seems no longer covered by the doc.

```sh
$ brew install terraform
```

Upgrade:

```sh
$ brew upgrade terraform
```

#### Tap

An alternative.

```sh
$ brew tap hashicorp/tap
$ brew install hashicorp/tap/terraform
```

Update:

```sh
$ brew update # Maybe not needed since update is always done, at least not for taps.
$ brew upgrade hashicorp/tap/terraform
```


## Ubuntu/Debian on Linux

1. Add the HashiCorp GPG key:
    ```sh
    $ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    ```
1. Add the official HashiCorp Linux repository:
    ```sh
    $ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    ```
1. Update and install.
    ```sh
    $ sudo apt-get update && sudo apt-get install terraform
    ```


## Verify

```sh
$ terraform -help
```
