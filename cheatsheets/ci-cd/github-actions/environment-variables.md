---
title: Environment variables
description: How to set env variables at various levels
---

{% raw %}


## Resources

See docs:

- [Environment variables](https://docs.github.com/en/actions/reference/environment-variables).
- [Context and expression syntax](https://docs.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions)


## Summary

How to set an environment variable at each level.

```yaml
env:
  MY_VAR: My global-level value
  
jobs:
  my-build:
    env: 
      MY_VAR: My job-level value
    
    steps:
      - name: My step
        env: 
          MY_VAR: My step-level value
```

Note that you can set the same variable at multiple levels, it will just be overriden at lower levels.

For security, you should avoid setting a variable at the job or global level, unless it actually needs to be used across multiple steps.


## Examples

Here we set and use a value at each level, with an `if` statement and `echo`.

### Global level

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
    run: echo "$GITHUB_CONTEXT"
    env:
      GITHUB_CONTEXT: ${{ toJSON(github) }}
```

{% endraw %}
