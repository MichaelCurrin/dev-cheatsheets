# Python imports

Fix issues where imports are not recognized in your app.

e.g. If you have `myapp` directory and your code has imports relative to that which are not recognized.

In `.vscode/settings.json`.

```json
{
  "python.analysis.extraPaths": [
    "./myapp"
  ],
}
```

Note setting `.env` with `PYTHONPATH=myapp` does not solve the issue in VS Code but it might help with CLI tools like testing.
