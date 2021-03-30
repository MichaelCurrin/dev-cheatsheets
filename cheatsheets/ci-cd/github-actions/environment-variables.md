---
title: Environment variables
description: How to set at various levels
---

## Resources

See docs:

- [Environment variables](https://docs.github.com/en/actions/reference/environment-variables).
- [Context and expression syntax](https://docs.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions)


## Set and use value

You could even combine these levels - such as set a value at a higher level and then override it at a lower level.

An `if` statement is used here to show how it works with `env`, but you can omit that.

### Global

Set values available to all jobs and steps in the workflow file.

```yaml
env:
  GREET_NAME: World
  
jobs:
  build:
    steps:
      - name: "Greet"
        if: env.GREET_NAME == 'World'
        run: echo "Hello, $GREET_NAME"
```

### Job level

Job-specific environment variables. These will be available to steps.

```yaml
jobs:
  build:
    env:
      GREET_NAME: World
      
    steps:
      - name: "Greet"
        if: env.GREET_NAME == 'World'
        run: echo "Hello, $GREET_NAME"
```

### Step level

Step-specific environment variables. Sometimes used to pass values to an Action.

```yaml
jobs:
  build:
    steps:
      - name: People
        if: env.GREET_NAME == 'World'
        run: echo "Hello $GREET_NAME"
        env:
          GREET_NAME: World
```

More examples from the docs.

```yaml
steps:
  - name: People
    run: echo "Hello $FIRST_NAME $middle_name $Last_Name, today is Monday!"
    env:
      FIRST_NAME: Mona
      middle_name: The
      Last_Name: Octocat

  - name: Dump GitHub context
    env:
      GITHUB_CONTEXT: ${{ toJSON(github) }}
    run: echo "$GITHUB_CONTEXT"
```
