# Ignoring rules



## Ignore deno rule

```typescript
// deno-lint-ignore no-undef
document.getElementById('root')
```


## Ignore TypeScript rule

See [Ignoring rules][] in the TypeScript section of Dev Cheatsheets.

[Ignoring rules]: {% link cheatsheets/typescript/ignoring-rules.md %}


## Semantic checking

Must be at the top of a file.

Enable:

```typescript
// @ts-check
```

Disable:

```typescript
// @ts-no-check
```
