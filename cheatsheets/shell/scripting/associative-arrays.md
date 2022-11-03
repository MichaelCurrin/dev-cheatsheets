# Associative arrays

## Syntax

Create:

```sh
declare -A MY_ARRAY
```

Update:

```sh
MY_ARRAY[abc]=def
```
Retrieve:

```sh
echo MY_ARRAY[abc]
# def
```

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
