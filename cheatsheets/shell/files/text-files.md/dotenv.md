---
title: Dotenv
---

> A load a dotenv file.

Export the vars in `.env` file into your shell.

Simple

```sh
export $(< .env) | xargs)
```

Check if it exists first and ignore comments.

```sh
if [ -f .env ]; then
  export $(egrep -v '^#' .env | xargs)
fi
```

[Gist source](https://gist.github.com/judy2k/7656bfe3b322d669ef75364a46327836)

See also in my cookbook:

- [dotenv](https://github.com/MichaelCurrin/code-cookbook/blob/master/recipes/shell/dotenv.md)
