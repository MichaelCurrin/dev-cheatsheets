---
title: Terraform
---

## Resources

- Homepage: [terraform.io](https://www.terraform.io/)
    > Use Infrastructure as Code to provision and manage any cloud, infrastructure, or service
- Download: [Downloads](https://www.terraform.io/downloads.html) page
- GitHub: [hashicorp/terraform](https://github.com/hashicorp/terraform)
    > Terraform enables you to safely and predictably create, change, and improve infrastructure. It is an open source tool that codifies APIs into declarative configuration files that can be shared amongst team members, treated as code, edited, reviewed, and versioned.


## CLI

See [Commmands](https://www.terraform.io/docs/commands/index.html) in the docs. The menu on the left there covers each command in detail.

Here is the help for Terraform `0.12`. Using `-help` will show the same output.

<details>
    
<summary>
    <pre><code>$ terraform</code></pre>
</summary>

<pre>
Usage: terraform [-version] [-help] <command> [args]

The available commands for execution are listed below.
The most common, useful commands are shown first, followed by
less common or more advanced commands. If you're just getting
started with Terraform, stick with the common commands. For the
other commands, please read the help and docs before usage.

Common commands:
    apply              Builds or changes infrastructure
    console            Interactive console for Terraform interpolations
    destroy            Destroy Terraform-managed infrastructure
    env                Workspace management
    fmt                Rewrites config files to canonical format
    get                Download and install modules for the configuration
    graph              Create a visual graph of Terraform resources
    import             Import existing infrastructure into Terraform
    init               Initialize a Terraform working directory
    output             Read an output from a state file
    plan               Generate and show an execution plan
    providers          Prints a tree of the providers used in the configuration
    refresh            Update local state file against real resources
    show               Inspect Terraform state or plan
    taint              Manually mark a resource for recreation
    untaint            Manually unmark a resource as tainted
    validate           Validates the Terraform files
    version            Prints the Terraform version
    workspace          Workspace management

All other commands:
    0.12upgrade        Rewrites pre-0.12 module source code for v0.12
    debug              Debug output management (experimental)
    force-unlock       Manually unlock the terraform state
    push               Obsolete command for Terraform Enterprise legacy (v1)
    state              Advanced state management
</pre>

</details>


## Usage

### Basics

Follow these three commands in order as a started for using Terraform.

1. Install depedendencies.
    ```sh
    $ terraform init
    ```
2. Preview changes.
    ```sh
    $ terraform plan
    ```
3. Deploy changes.
    ```sh
    $ terraform apply .
    ```

### Working with plans

- [Plan commands](https://www.terraform.io/docs/commands/plan.html) docs.

Generate plan on the console output with colors.

```sh
$ terraform plan
```

Or if you want to persist the plans.

```sh
$ mkdir -p plans
```

Write out to human-readable plain text file.

```sh
$ terraform plan --no-color > plans/foo.txt
```

Use `&>` instead of `>` to include `stderr`.

We strip colors to avoid messages like `[0m[1m[32mNo changes. Infrastructure is up-to-date.[0m[32m`

Write out binary plan file.

```sh
$ terraform plan -out plans/foo.tfplan
```

That can be viewed using:

```sh
$ terraform show plans/foo.tfplan
```

For JSON output: 

```sh
$ terraform show -json <planfile>
```

From [JSON Format](https://www.terraform.io/docs/internals/json-format.html) TF doc.

You can apply a plan directly, which saves TF doing a plan internally within the apply step.

```sh
$ terraform apply plans/foo.tfplan
```

Or for a target directory.

```sh
$ terraform apply DIR
```


### Development

Format the Terraform code.

```sh
$ terraform fmt
```

Validate the Terraform code.

```sh
$ terraform validate
```

### Workspaces

- [Workspace command](https://www.terraform.io/docs/commands/workspace/index.html) docs.

Usage:

```sh
$ terraform workspace <subcommand> [options] [args]
```

```sh
$ terraform workspace --help
```
```
Usage: terraform workspace

  New, list, show, select and delete Terraform workspaces.

Subcommands:
    delete    Delete a workspace
    list      List Workspaces
    new       Create a new workspace
    select    Select a workspace
    show      Show the name of the current workspace
```

Example:

```sh
$ WS_NAME=foo
$ terraform workspace select $WS_NAME || terraform workspace new $WS_NAME
```

### Alias

Recommended for shell config:

```sh
alias tf=terraform
```
