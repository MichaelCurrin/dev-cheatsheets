# Jobs cheatsheet
> Syntax for jobs in GH actions workflow file

{% raw %}

See [Workflow syntax for Github Actions](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions) in Github docs.

> A workflow run is made up of one or more jobs. Jobs run in **parallel** by default.
>
> To run jobs sequentially, you can define dependencies on other jobs using the `jobs.<job_id>.needs` keyword.
>
> Each job runs in an environment specified by runs-on.


## Job IDs

Each job must have a unique ID as below. This must start with a letter or `_` and contain only alphanumeric characters, `-`, or `_`.

```yaml
jobs:
  my_first_job:
    name: My first job

  my_second_job:
    name: My second job
```

Using `runs-on`.

```yaml
jobs:
  my_first_job:
    runs-on: ubuntu-latest
    name: My first job

  my_second_job:
    runs-on: ubuntu-latest
    name: My second job
```


## Needs

By default jobs run in parallel.

Here we setup a sequence of jobs that only run if the previous one passed.

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

See [job output](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjobs_idoutputs) in the docs for how to persist or [upload and download artifications](https://docs.github.com/en/actions/guides/storing-workflow-data-as-artifacts#passing-data-between-jobs-in-a-workflow). If you don't do this, then a `build` directory from one job can't be used by the other job.

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
        - run: echo ${{needs.job1.outputs.output1}} ${{needs.job1.outputs.output2}}
    ```


## If statement

This step only runs when the event type is a pull_request and the event action is unassigned.

- `main.yml`
    ```yaml
    steps:
     - name: My first step
       if: ${{ github.event_name == 'pull_request' && github.event.action == 'unassigned' }}
       run: echo This event is a pull request that had an assignee removed.
    ```
- `main.yml`
    ```yaml
    steps:
    - name: Print a greeting
      env:
        MY_VAR: Hi there! My name is
        FIRST_NAME: Mona
        MIDDLE_NAME: The
        LAST_NAME: Octocat
      run: |
        echo $MY_VAR $FIRST_NAME $MIDDLE_NAME $LAST_NAME.
    ```

This can be useful if you want just one workflow file and one job but want to skip a deploy steps at the end.

Read more

- [Context and Expression Syntax](https://help.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions)
- [If steps](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idsteps).


## Related

### Env

```yaml
env:
  SERVER: production
```

### Defaults

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

{% endraw %}
