---
title: Persist 
description: How to reuse a value from one step in a later step or job
---

{% raw %}

See more info the GH Actions [Setup Go](https://michaelcurrin.github.io/code-cookbook/recipes/ci-cd/github-actions/workflows/go/setup-go.html) section of my Code Cookbooks.


## Using GitHub env file

From [Environment Variables](https://docs.github.com/en/actions/reference/environment-variables#about-environment-variables) in the docs.

> You can also use the `GITHUB_ENV` environment file to set an environment variable that the following steps in a workflow can use. 
>
> The environment file can be used directly by an action or as a shell command in a workflow file using the run keyword.

That links to [Setting an environment variable](https://docs.github.com/en/actions/reference/workflow-commands-for-github-actions#setting-an-environment-variable)

```sh
echo "{name}={value}" >> $GITHUB_ENV
```

> Creates or updates an environment variable for any actions running next in a job. The action that creates or updates the environment variable does not have access to the new value, but all subsequent actions in a job will have access. Environment variables are case-sensitive and you can include punctuation.

```yaml
steps:
  - name: Set the value
    id: step_one
    run: echo "action_state=yellow" >> $GITHUB_ENV
        
  - name: Use the value
    id: step_two
    run: echo "${{ env.action_state }}" # This will output 'yellow'
```

### Examples

Get a version from a file and use it as a parameter for an action in another step.

```yaml
steps:
  - name: Get Go version
    run: echo "GO_VERSION=$(grep ...)" >> $GITHUB_ENV
    
  - uses: actions/setup-go@v2
    with:
      go-version: ${{ env.GO_VERSION }}
```


## Use step variable output

### Syntax

Reuse across steps. My trimmed down example from the docs example.

```yaml
steps:
  - id: step1
    run: echo "::set-output name=test::hello"

  - id: step2
    run: echo "::set-output name=test::world"

  - name: Display
    run: |
      echo "Step 1 test: ${{ steps.step1.outputs.test }}"
      echo "Step 2 test: ${{ steps.step1.outputs.test }}"
```

### Examples

Note use of the display in the first step, to check the value which was set in the same step.

```yaml
steps:
  - name: Get Go version
    id: vars
    run: |
      echo ::set-output name=go_version::$(grep ...)
      echo "Using Go version ${{ steps.vars.outputs.go_version }}"

  - name: Setup go
    uses: actions/setup-go@v2
    with:
      go-version: ${{ steps.vars.outputs.go_version }}
```

From [Yarn](https://michaelcurrin.github.io/code-cookbook/recipes/ci-cd/github-actions/workflows/node/yarn.html) guide.

We run `yarn cache dir` command and store and retrieve the value.

```yaml
steps:
  - name: Get yarn cache
    id: yarn-cache
    run: echo "::set-output name=dir::$(yarn cache dir)"

  - uses: actions/cache@v1
    with:
      path: ${{ steps.yarn-cache.outputs.dir }}
      key: ${{ runner.os }}-yarn-${{ hashFiles('**/yarn.lock') }}
      restore-keys: |
        ${{ runner.os }}-yarn-
```


## Pass between jobs

From [docs](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions).

> A map of outputs for a job. Job outputs are available to all downstream jobs that depend on this job. 

> Outputs containing secrets are redacted on the runner and not sent to GitHub Actions.

### Syntax

This docs example shows how to reuse values across steps and across jobs. You only need to setup the `outputs` section for reuse across jobs.

- `main.yml`
    ```yaml
    jobs:
      job1:
        runs-on: ubuntu-latest

        outputs:
          output1: ${{ steps.step1.outputs.test }}
          output2: ${{ steps.step2.outputs.test }}

        steps:
          - id: step1
            run: echo "::set-output name=test::hello"

          - id: step2
            run: echo "::set-output name=test::world"

          - name: Display
            run: echo "${{ steps.step1.outputs.test }}"

      job2:
        runs-on: ubuntu-latest
        needs: job1
        steps:
          - run: echo ${{ needs.job1.outputs.output1 }} ${{ needs.job1.outputs.output2 }}
    ```

Returning a JSON object - from [docs](https://docs.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions#example-returning-a-json-object).

- `main.yml`
    ```yaml
    jobs:
      job1:
        runs-on: ubuntu-latest
        
        outputs:
          matrix: ${{ steps.set-matrix.outputs.matrix }}
          
        steps:
          - id: set-matrix
            run: echo "::set-output name=matrix::{\"include\":[{\"project\":\"foo\",\"config\":\"Debug\"},{\"project\":\"bar\",\"config\":\"Release\"}]}"
      
      job2:
        needs: job1
        
        runs-on: ubuntu-latest
        
        strategy:
          matrix: ${{ fromJSON(needs.job1.outputs.matrix) }}
          
        steps:
          - run: build
    ```

{% endraw %}
