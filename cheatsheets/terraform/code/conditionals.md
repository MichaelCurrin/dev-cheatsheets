# Conditionals

## Ternary

```terraform
condition ? true_val : false_val
```

e.g.

```terraform
foo = var.abc === true ? "dev" : "prod"
```
