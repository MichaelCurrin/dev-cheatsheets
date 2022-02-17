# Install and upgrade


## Resources

See more info here in the docs:

- [Download Terraform](https://www.terraform.io/downloads.html) - on Terraform website. Choose your OS and click a URL for a zipped binary.
- [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) in the Hashicorp docs for detailed instructions.


## Approaches to install

The downside of the binary approach is requires manually checking for a version in the browser on an initial install and on every upgrade. 

The approaches using a package manager are more convenient to install and upgrade, without needing a browser.

### Download binary

1. Go to [Download Terraform](https://www.terraform.io/downloads.html) page on Terraform website or see the list [releases](https://releases.hashicorp.com/terraform/) if you need an older version.
1. Download an archived binary.
1. Unzip it.
1. Move `terraform` to your executables directory in your `PATH`.

e.g. for macOS/Darwin:

```sh
$ cd ~/Downloads
$ wget https://releases.hashicorp.com/terraform/1.0.5/terraform_1.0.5_darwin_amd64.zip
$ tar xzvf terraform_1.0.5_darwin_amd64.zip
$ mv terraform /usr/local/bin
```

Or, if you want to keep it separate from any existing Terraform versions intalled.

```sh
$ mv terraform /usr/local/bin/terraform1.0
$ terraform1.0 -v
```

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

You can use `apt` / `apt-get` to manage Terraform. But first you hav to add to your Debian repositorities.

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
    $ sudo apt-get update
    $ sudo apt-get install terraform
    ```
    

## Verify installation

```console
$ terraform -v
Terraform v1.0.5
on darwin_amd64
```
