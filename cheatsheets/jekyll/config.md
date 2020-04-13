# Jekyll config cheatsheet

## Null values

```yaml
key: nil
```

## Plugins

Old style - `gems`.

New style - `plugins`.

Should should be an array. These are valid:

```yaml
plugins: []
```
```yaml
plugins: [foo]
```

```yaml
plugins:
  - foo
  - bar
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE4ODg0OTM1MTldfQ==
-->