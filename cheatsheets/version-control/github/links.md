# Links

## Related

- [Repo API response][] for the REST API, including URLs and in some cases how to filter them using shell commands.

[Repo API response]: https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/version-control/github/api/v3/repos.html


## Clone

```sh
$ git clone CLONE_URL
```

### Clone HTTPS

```
https://github.com/MichaelCurrin/cheatsheets.git
```

### Clone SSH

```
git@github.com:MichaelCurrin/cheatsheets.git
```


## Download URLs

### Source code

e.g.

```sh
$ curl -O DOWNLOAD_URL
```

#### master

- [https://github.com/MichaelCurrin/cheatsheets/archive/master.zip](https://github.com/MichaelCurrin/cheatsheets/archive/master.zip)

```sh
$ curl -O https://github.com/MichaelCurrin/cheatsheets/archive/master.zip
```

Then you have a file `master.zip`.

### Feature branch

Note this link will not work in this case.

- [https://github.com/MichaelCurrin/cheatsheets/archive/feat-branch.zip](https://github.com/MichaelCurrin/cheatsheets/archive/feat-branch.zip)

### Specific tag

- [https://github.com/MichaelCurrin/cheatsheets/archive/v1.0.0.zip](https://github.com/MichaelCurrin/cheatsheets/archive/v1.0.0.zip)

Note you need `-L` to follow a redirect.

```sh
$ curl -L -O https://github.com/MichaelCurrin/cheatsheets/archive/v1.0.0.zip
```

### Assets

### Latest release

Based on [GH docs - Linking to a Release](https://docs.github.com/en/repositories/releasing-projects-on-github/linking-to-releases).

Download the latest release's assets:

```
/owner/name/releases/latest/download/asset-name.zip
```

I find that doesn't work for me.

e.g. this is invalid:

- [https://github.com/trashhalo/imgcat/releases/download/latest/checksums.txt](https://github.com/trashhalo/imgcat/releases/download/latest/checksums.txt)

But this works:

- [https://github.com/trashhalo/imgcat/releases/download/v1.2.0/checksums.txt](https://github.com/trashhalo/imgcat/releases/download/v1.2.0/checksums.txt)

Also the other assets on there have the tag name in filename, so you can't just do a generic way.

See assets here:

- [https://github.com/trashhalo/imgcat/releases/tag/v1.2.0](https://github.com/trashhalo/imgcat/releases/tag/v1.2.0)


## GitHub UI URLs

The examples here are using Go Project Template repo.

This has releases which contain both 

- source code of the repo at that tag point, as an archive (`.zip` and `.tar.gz`).
- assets generated by CI or attached manually. (`.tar.gz` containing binary executables)

### All releases

- [https://github.com/MichaelCurrin/go-project-template/releases/](https://github.com/MichaelCurrin/go-project-template/releases/)

### Target release

- [https://github.com/MichaelCurrin/go-project-template/releases/tag/v0.4.0](https://github.com/MichaelCurrin/go-project-template/releases/tag/v0.4.0)

Download binary:

- [https://github.com/MichaelCurrin/go-project-template/releases/download/v0.4.0/go_project_template_0.4.0_darwin.tar.gz](https://github.com/MichaelCurrin/go-project-template/releases/download/v0.4.0/go_project_template_0.4.0_darwin.tar.gz)

Download tarball:

- [https://github.com/MichaelCurrin/go-project-template/archive/refs/tags/v0.4.0.tar.gz](https://github.com/MichaelCurrin/go-project-template/archive/refs/tags/v0.4.0.tar.gz)

### Latest release

This only works if your have a release, not just pre-releases.

- [https://github.com/MichaelCurrin/code-cookbook/releases/latest](https://github.com/MichaelCurrin/code-cookbook/releases/latest)

That redirects you to a page like:

- [https://github.com/MichaelCurrin/code-cookbook/releases/tag/v4.0.0](https://github.com/MichaelCurrin/code-cookbook/releases/tag/v4.0.0)