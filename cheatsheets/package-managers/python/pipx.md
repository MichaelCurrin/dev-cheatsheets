# pipx

Homepage: [pipx.pypa.io](https://pipx.pypa.io/).


## Install

Install with your OS package manager (`brew`, `apt`), as per the homepage.

## Basic Commands

### Install a package
```sh
pipx install PACKAGE_NAME
```

### Run a package without installing
```sh
pipx run PACKAGE_NAME
```

### List installed packages
```sh
pipx list
```

### Uninstall a package
```sh
pipx uninstall PACKAGE_NAME
```

### Upgrade a package
```sh
pipx upgrade PACKAGE_NAME
```

### Upgrade all packages
```sh
pipx upgrade-all
```

### Reinstall a package
```sh
pipx reinstall PACKAGE_NAME
```

## Managing Package Environments

### Install a package with specific Python version
```sh
pipx install --python python3.10 PACKAGE_NAME
```

### Install package with specific pip arguments
```sh
pipx install PACKAGE_NAME --pip-args="--no-deps"
```

### Install a package from Git repository
```sh
pipx install git+https://github.com/user/repo.git
```

### Install a package with specific version
```sh
pipx install PACKAGE_NAME==1.2.3
```
