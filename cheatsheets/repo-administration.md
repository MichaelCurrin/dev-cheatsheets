# Repo administration


## Add settings file

Use force if it is globally ignored.

```sh
git add -f .vscode/*
```


## Disable auto format on save

`.vscode/settings.json`
```json
{
    "editor.formatOnSave": false
}
```

System default is `false`.  So if your user setting is `true`, then you can only set to `true` as well or untick and the config option (and file if it's empty) disappears. So you need to add it as `true` and then manually edit it. Or create if from scratch.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE4NjA4NTUxNDRdfQ==
-->