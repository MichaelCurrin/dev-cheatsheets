# Environment
> Setting environment variables


Setup a variable.

```terraform
variable "FOO" {}
```

Setup your code.

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
