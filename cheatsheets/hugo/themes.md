# Themes

## Install

Follow instructions from the Ananke theme's docs.

### Install as a Hugo module

1. From your project's root directory, initiate the hugo module system if you haven't already:
   ```sh
   $ hugo mod init github.com/<your_user>/<your_project>

1. Add the theme's repo to your `config.toml`:
   ```toml
   theme = ["github.com/theNewDynamic/gohugo-theme-ananke"]
   ```
   
### Install as submodule

```sh
$ git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
```

This creates `.gitsubmodules` file:

```toml
[submodule "themes/ananke"]
path = themes/ananke
url = https://github.com/budparr/gohugo-theme-ananke.git
```

And might add this to config:

```yoml
theme = "ananke"
```
