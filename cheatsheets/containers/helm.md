---
title: Helm
description: The package manager for Kubernetes
---

## Links

- [Installing](https://helm.sh/docs/intro/install/)
- [Commands](https://helm.sh/docs/helm/helm/)


## Installation

### HomeBrew on macOS

```sh
$ brew install helm
```

### APT on Ubuntu

```sh
$ curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
$ sudo apt-get install apt-transport-https --yes
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
```

```sh
$ sudo apt-get update
$ sudo apt-get install helm
```

### Snap on Ubuntu

```sh
$ sudo snap install helm --classic
```
