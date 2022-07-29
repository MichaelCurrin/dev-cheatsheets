# filter-name

This is not a built-in command as you have to install it.

Install and run the [git-filter-repo][] tool, which is linked from the [git-filter-branch][] official docs as a better replacement.

[git-filter-repo]: https://github.com/newren/git-filter-repo
[git-filter-branch]: https://git-scm.com/docs/git-filter-branch

## Examples

Example from their docs, modified here for clarity. Note use of Python code for callbacks.

```sh
$ git filter-repo --email-callback '
  return b"new@example.com" if email == b"old@localhost" else email
'
```

Take that further:

```sh
$ git filter-repo --name-callback '
  return b"New name" if name == b"Old name" else name
'
```

Based on a [script](https://github.com/newren/git-filter-repo/blob/main/t/t9392-python-callback.sh) in the repo:

```sh
# Update part of name
git filter-repo --name-callback "return name.replace(b\"N.\", b\"And\")" &&

# Update part of email.
git filter-repo --email-callback "return email.replace(b\".com\", b\".org\")"

# Set multiple fields. Note this is a simple case without conditional checks.
git filter-repo --commit-callback "
  commit.committer_name  = 'ABC'
  commit.author_name = 'ABC
  commit.committer_email = 'abc@example.com'
  commit.author_email = 'abc@example.com'
"
```
