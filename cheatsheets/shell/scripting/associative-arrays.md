# Associative arrays

## Syntax

### Create

```sh
declare -A MY_ARRAY
```

### Update

```sh
MY_ARRAY[abc]=def
```

You can have spaces in a key.

```sh
MY_ARRAY[abc xyz]=def
```

### Retrieve

```sh
echo MY_ARRAY[abc]
# def
```

### Get keys

Show all keys.

```console
$ declare -A MYMAP=( [foo]=bar [fizz buzz]=123 )
$ echo "${!MYMAP[@]}"
foo fizz buzz
```

Loop through all keys.

```console
$ for K in "${!MYMAP[@]}"; do echo $K; done
foo
fizz buzz
```

### Values

Loop through all values.

```console
$ for V in "${MYMAP[@]}"; do echo $V; done
bar
123
```

## Deleting values

See [Bash associative array examples](https://www.artificialworlds.net/blog/2012/10/17/bash-associative-array-examples/).


## Examples

Define and then set values:

```sh
declare -A MY_ENVS
MY_ENVS[d]=develop
MY_ENVS[s]=stage
MY_ENVS[p]=production
```

Define and then set values in one line:

```sh
declare -A MY_ENVS=([d]=develop [s]=stage [p]=production)
```

Sample usage to lookup:

```sh
echo ${MY_ENVS[d]}
# develop

ENV='d'
TARGET_ENV=${MY_ENVS[$ENV]}
echo $TARGET_ENV
# develop
```
