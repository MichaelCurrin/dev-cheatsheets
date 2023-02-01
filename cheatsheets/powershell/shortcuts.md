# Shortcuts

## Alias

```sh
Set-Alias -Name NAME -Value VALUE
```

e.g.

```sh
Set-Alias -Name kdev -Value "kubectl config set-context atlas-develop"
```


## Functions

```sh
function FUNCTIONAME { BODY }
```

e.g.

```sh
function kenv { kubectl config use-context atlas-$args }
```
