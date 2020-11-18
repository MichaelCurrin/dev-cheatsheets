# AWS
> Perform actions on AWS using the command-line

See [AWS CLI](https://aws.amazon.com/cli/) docs.


## Install with a package manager

### macOS

See [AWSCLI](https://formulae.brew.sh/formula/awscli) formula on Homebrew.

```sh
$ brew install awscli
```

### Linux

From [Installing, updating, and uninstalling the AWS CLI version 2 on Linux](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install) doc.

```sh
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
$ unzip awscliv2.zip
$ sudo ./aws/install
```


## Install in a virtual environment

Install and run the AWS CLI in a new Python 3 virtual environment.

### Installation

```sh
$ mkdir ~/.local/virtualenvs
$ python3 -m venv ~/.local/virtualenvs/aws
$ source ~/.local/virtualenvs/aws/bin/activate
$ pip install awscli
```

### Usage

Note that even though the package is `awscli` on PyPI and your `pip list` output, you must invoke using `aws` command.

```sh
$ source ~/.local/virtualenvs/aws/bin/activate

$ aws --version
```


## Help

```sh
$ aws help
```
```
AWS()                                                                    AWS()



NAME
       aws -

DESCRIPTION
       The  AWS  Command  Line  Interface is a unified tool to manage your AWS
       services.

SYNOPSIS
          aws [options] <command> <subcommand> [parameters]

       Use aws command help for information on a  specific  command.  Use  aws
       help  topics  to view a list of available help topics. The synopsis for
       each command shows its parameters and their usage. Optional  parameters
       are shown in square brackets.
...
```
