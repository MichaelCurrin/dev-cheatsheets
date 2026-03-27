---
description: Setup and run the Java runtime to compile and run JVM code
---
# Java runtime

## Install

### macOS

See [Install](https://openjdk.org/install/) page.

```sh
brew install openjdk
```

## Configure

If you have trouble running, do these steps.

### macoS

```sh
sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
```

Add to shell config if needed:

```sh
export JAVA_HOME=$(/usr/libexec/java_home)
```

## Run

```sh
java -jar hello.jar
```
