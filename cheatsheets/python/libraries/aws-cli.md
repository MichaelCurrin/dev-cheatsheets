---
title: AWS CLI
description: Perform actions on AWS using the command-line
---

See [AWS CLI](https://aws.amazon.com/cli/) docs.


## Install with a package manager

### macOS

See [AWSCLI](https://formulae.brew.sh/formula/awscli) formula on Homebrew.

```sh
$ brew install awscli
```

### Linux

From [Installing, updating, and uninstalling the AWS CLI version 2 on Linux](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install) doc.

```console
$ curl 'https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip' -o awscliv2.zip
$ unzip awscliv2.zip
$ sudo ./aws/install
You can now run: /usr/local/bin/aws --version
```

```console
$ aws --version
aws-cli/2.4.5 Python/3.8.8 Linux/5.4.117-58.216.amzn2.x86_64 exe/x86_64.debian.9 prompt/off
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

### Usage in virtual environment

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


## Usage

Some sample commands.

### S3

Upload file:

```sh
$ aws s3 cp my_file.txt s3://my-bucket/
$ # Note forward slash, otherwise you'll create a file called `my_path`.
$ aws s3 cp my_file.txt s3://my-bucket/my_path/
$ aws s3 cp my_file.txt s3://my-bucket/my_path/my_new_name.txt
```

Upload directory:

```sh
$ aws s3 cp my_dir s3://my-bucket/ --recursive
```

List contents:

```sh
$ aws s3 ls s3://my-bucket/
$ # Use forward slash to show contents rather than dir itself.
$ aws s3 ls s3://my-bucket/my-dir/
```
