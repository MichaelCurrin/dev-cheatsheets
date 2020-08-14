---
title: Jekyll config
---

Jekyll docs reference - [Config options](https://jekyllrb.com/docs/configuration/options/). That covers both CLI and config file options together.


## Null values

```yaml
key: nil
```

## Plugins

Old style - `gems`.

New style - `plugins`.

Should should be an array. These are valid:

```yaml
plugins: []
```
```yaml
plugins: [foo]
```

```yaml
plugins:
  - foo
  - bar
```


## URLs

```yaml
url: "http://example.com"
```

```yaml
baseurl: ""
baseurl: "/my-repo"
```


## Build settings

Thes can be set with CLI flags, or in the config here if you prefer.

```yaml
future: true
profile: true
livereload: true
``

> Cause a build to fail if there is a YAML syntax error in a page's front matter. 

```yaml
strict_front_matter: true
```
