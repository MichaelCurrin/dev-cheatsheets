# Environment
> Setting environment variables


Set up a variable.

```terraform
variable "FOO" {}
```

Set up your code.

```
{
  foo = var.FOO
}
```

Set the variable using `TF_VAR_` prefix.

```sh
export TF_VAR_FOO=bar
```

Run.

```sh
$ terraform plan
```
