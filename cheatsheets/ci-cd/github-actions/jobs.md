---
description: Syntax for jobs in GH actions workflow file
---
# Jobs

{% raw %}

See [Workflow syntax for GitHub Actions](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions) in GitHub docs.

> A workflow run is made up of one or more jobs. Jobs run in **parallel** by default.
>
> To run jobs sequentially, you can define dependencies on other jobs using the `jobs.<job_id>.needs` keyword.
>
> Each job runs in an environment specified by runs-on.


## Job IDs

A workflow usually has just one job. The example below has two jobs.

Each job must have a unique ID as below. This must start with a letter or `_` and contain only alphanumeric characters, `-`, or `_`.

```yaml
jobs:
  my_first_job:
    name: My first job

  my_second_job:
    name: My second job
```

Here the first job ID is `my_first_job`. This example from the docs and YAML in general uses underscores but usually I see hyphens used instead.


## Operating system

Use `runs-on` to specify the operating system. Using `ubuntu-latest` as below is the most common approach.

```yaml
jobs:
  my-job:
    name: My job
    runs-on: ubuntu-latest
```

For a list of available systems, see [GitHub Hosted Runners][] in the docs.

[GitHub Hosted Runners]: https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners

Here is an example with two jobs - they each need operating systems set.

- `main.yml`
    ```yaml
    jobs:
      my-first-job:
        name: My first job

        runs-on: ubuntu-latest

      my-second-job:
        name: My second job

        runs-on: ubuntu-latest
    ```

You can run one job multiple times across a range of operating systems.

- `main.yml`
    ```yaml
    jobs:
      build:
        strategy:
          matrix:
            os: [ubuntu-latest, macOS-latest, windows-latest]
        runs-on: ${{ matrix.os }}
    ```

Support multiple jobs - one for each OS. Based on [OBS Studio](https://github.com/obsproject/obs-studio/blob/master/.github/workflows/main.yml) workflow.

- `main.yml`
    ```yaml
    jobs:
      macos64:
        name: 'macOS 64-bit'
        runs-on: [ macos-latest ]

        steps:
        # ...

      ubuntu64:
        name: 'Linux/Ubuntu 64-bit'
        runs-on: [ ubuntu-latest ]

        steps:
        # ...

      win64:
        name: 'Windows 64-bit'
        runs-on: [ windows-latest ]

        steps:
        # ...
    ```


## Package version matrix

Within `matrix` you can specify a version of your language.

Under `matrix`, you can set any variable name and pass it an array, then use the value later using `with` and an appropriate field name for the action.

- `main.yml`
    ```yaml
    strategy:
      matrix:
        foo-version: ["1", "2"]

    steps:
      - name: Set up Foo ${{ matrix.foo-version }}
        uses: # ...
        with:
          foo-version: ${{ matrix.foo-version }}
    ```

Example - here the `x` is a literal character that gets interpeted for you by an action.

```yaml
matrix:
  python-version: ["3.6", "3.x" ]
  deno: ["v1.x", "nightly"]
```

Without matrix, you would just do steps as:

```yaml
steps:
  - name: Set up Foo
    with:
      foo-version: "v1.x"
```


## Job sequence

By default, jobs run in **parallel**.

Here we set up a **sequence** of jobs. Each job only run if the previous one passed.

[Job Needs](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idneeds) docs.

> Identifies any jobs that must complete successfully before this job will run. It can be a string or array of strings. If a job fails, all jobs that need it are skipped unless the jobs use a conditional statement that causes the job to continue.

- `main.yml`
    ```yaml
    jobs:
      job1:

      job2:
        needs: job1

      job3:
        needs: [job1, job2]
    ```

See [job output](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjobs_idoutputs) in the docs for how to persist or [upload and download artifacts](https://docs.github.com/en/actions/guides/storing-workflow-data-as-artifacts#passing-data-between-jobs-in-a-workflow). If you don't do this, then a `build` directory from one job can't be used by the other job.

Using job output in a dependent job:

- `main.yml`
    ```yaml
    jobs:
      job1:
        runs-on: ubuntu-latest

        # Map a step output to a job output
        outputs:
          output1: ${{ steps.step1.outputs.test }}
          output2: ${{ steps.step2.outputs.test }}

        steps:
        - id: step1
          run: echo "::set-output name=test::hello"

        - id: step2
          run: echo "::set-output name=test::world"

      job2:
        runs-on: ubuntu-latest

        needs: job1

        steps:
        - run: echo ${{ needs.job1.outputs.output1 }} ${{ needs.job1.outputs.output2 }}
    ```


## Conditional logic

### Job if statement

How to run jobs on a condition

```yaml
jobs:
  build:
    steps:
      # ...

  deploy:
    if: "github.event_name == 'push'"
    needs: checks
    steps:
      # ...
```

### Step if statement

Control whether a single step will run or be skipped.

Here, this step only runs when the event type is `pull_request` and the event action is `unassigned`.

- `main.yml`
    ```yaml
    steps:
      - name: My first step
       if: ${{ github.event_name == 'pull_request' && github.event.action == 'unassigned' }}
       run: echo "This event is a pull request that had an assignee removed."
    ```

This can be useful if you want just one workflow file and one job but want to skip a deploy steps at the end.

e.g.

```yaml
    steps:
        - name: Build
          # Create output in dist directory...

        - name: Deploy to GH Pages 🚀
          if: ${{ github.event_name != 'pull_request' }}
          uses: peaceiris/actions-gh-pages@v3
          with:
            github_token: ${{ secrets.GITHUB_TOKEN }}
            publish_dir: dist
```

Using a condition for the last step also saves the trouble of using code to persist artifacts (like build output) between two jobs.

Read more:

- [Context and Expression Syntax](https://help.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions)
- [If steps](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idsteps).


## Related

### Env variables

[Environment variables](https://docs.github.com/en/free-pro-team@latest/actions/reference/environment-variables)

You can use any case, but uppercase is typical. Note you cannot use `GITHUB_` as a variable name prefix as that is reserved.

```sh
env:
  FOO: bar
```

Node example:

```yaml
steps:
  - name: Build 🏗️
    run: yarn build
    env:
      NODE_ENV: production
```

Using a variable in `echo`.

- `main.yml`
    ```yaml
    steps:
      - name: Print a greeting
        env:
          MY_VAR: Hi there! My name is
          FIRST_NAME: Mona
          MIDDLE_NAME: The
          LAST_NAME: Octocat
        run: echo "$MY_VAR $FIRST_NAME $MIDDLE_NAME $LAST_NAME."
    ```

### Action parameters

Some actions take arguments variables - use `with` for those.

```yaml
with:
  foo: bar
```

e.g.

```yaml
steps:
  - name: Deploy to GH Pages 🚀
    if: ${{ github.event_name != 'pull_request' }}
    uses: peaceiris/actions-gh-pages@v3
    with:
      github_token: ${{ secrets.GITHUB_TOKEN }}
      publish_dir: dist
      keep_files: true
```

### Defaults

Setting the `defaults` attribute for variables to be used across the workflow file.

```yaml
defaults:
  foo: bar
```

```yaml
defaults:
  run:
    shell: bash
    working-directory: scripts
```

### Contexts

See [Contexts](https://docs.github.com/en/free-pro-team@latest/actions/reference/context-and-expression-syntax-for-github-actions#contexts) in the docs.

Here are a few values of interest:

- `github.event_name` e.g. `'pull'`
- `github.event.action` e.g. `'unassigned'`
- `github.repository` e.g. `Codertocat/Hello-World`
- `github.repository_owner` e.g. `Codertocat`
- `job.status`
- `runner.os`

> Warning: When using the whole `github` context, be mindful that it includes sensitive information such as github.token. GitHub masks secrets when they are printed to the console, but you should be cautious when exporting or printing the context.


{% endraw %}
