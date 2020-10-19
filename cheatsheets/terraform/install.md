# Install

From the TF docs [Install page](https://learn.hashicorp.com/tutorials/terraform/install-cli). That covers multiple languages.


## macOS

```sh
brew install terraform
```

Or

```sh
$ brew tap hashicorp/tap
$ brew install hashicorp/tap/terraform
```

## Linux

Add the HashiCorp GPG key.

```sh
$ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
``

Add the official HashiCorp Linux repository.

```sh
$ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

Update and install.

```sh
$ sudo apt-get update && sudo apt-get install terraform
```
