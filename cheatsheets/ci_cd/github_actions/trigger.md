# Trigger cheatsheet

Options for the `on` field to trigger deploys.

## Resources

See [Workflow syntax for Github Actions](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions) in Github docs.


## On push or pull request

### On push to any branch

```yaml
on: push
```

### Push or pull request to any branch

```yaml
on: [push, pull_request]
```


### Push or PR on target branch

```yaml
on:
  push:
    branches:
      - master
            
  pull_request:
    branches:
      - master
```


## On schedule

Using [on.schedule](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions#onschedule) parameter.

Check syntax using [crontab.guru](https://crontab.guru/) site.

Example:

```yaml
on:
  schedule:
    - cron:  '0 0 * * *'
```


## On releases

```yaml
on:
  release:
    # Only use the types keyword to narrow down the activity types that will trigger your workflow.
    types: [published, created, edited]
```


## Multiple events

Add trigger of page build. The release one does not affect the page build one.

```yaml
on:
  push:
    branches:
      - master
      
  pull_request:
    branches:
      - master
      
  page_build:
  
  release:
    types:
      - created
```
