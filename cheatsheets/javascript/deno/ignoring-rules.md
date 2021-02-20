# Ignoring rules



## Ignore deno rule

```typescript
// deno-lint-ignore no-undef
document.getElementById('root')
```


## Ignore TypeScript rule

Ignore on the next line.

```typescript
// @ts-ignore
```

Also ignore on the next line but require an error to exist.

```typescript
// @ts-expect-error
```


## Semantic checking

Must be at the top of a file.

Enable.

```typescript
// @ts-check
```

Disable.

```typescript
// @ts-no-check
```
