---
title: Dotenv file
description: |
  A `.env` file is a simple text file used to store environment variables for an application.
---

A `.env` file is a configuration file used to store environment variables. It's commonly used in development to keep sensitive information (like API keys) out of source code. It must be a valid shell script (usually Bash).

This is similar to `config.properties` in Java - see [article](https://www.baeldung.com/java-properties).


## Basic usage

- Create a file named `.env` in your project's root directory.
- Add variables in `KEY=VALUE` format, one per line. 
- Access variables in your code using `process.env.KEY` (Node.js) or similar methods in other languages

## Top tips

1. Never commit `.env` files with secrets in them to version control.
1. Use `.env.template` to share template of required variables.
1. Load `.env` files as early as possible in your application.
1. Validate required environment variables on startup.
1. You can use different `.env` files for different environments (e.g. `.env.development`, `.env.production`). Though you could set those variables instead as environment variables in your build pipeline such that as dotenv file is not needed in a deploymed environment.

## Syntax

- No spaces around `=` sign: `API_KEY=abcdef123456`
- Use quotes for values with spaces: `MESSAGE="Hello World"`
- Multi-line values:
  ```sh
  MULTI_LINE="line 1
  line 2"
  ```

## Sample content

```sh
# Database configuration
DB_HOST=localhost
DB_PORT=5432

# API Keys
API_KEY=sk_test_abcdef

# Multi-line example.
MULTI_LINE_VALUE="This is a
multi-line
value example"
```

## Load dotenv

### Manually

Run this in Bash to read the contents of the file and then set each as exported variables with `export`

```sh
$ export $(< .env)
```

Or this (does not work with comments in the file).

```sh
$ export $(xargs< .env)
```

Run that once in a terminal window. Then start your app.

In a Makefile, you can set this to make that easier:

```Makefile
run:
  export $(< .env) \
    && npm start
```

Then run:

```sh
$ make run
```

Related - see the [export command][] cheatsheet.

[export command]: {% link cheatsheets/shell/commands/export.md %}

### Automatic

Use a package that can read the `.env` file when your app starts. This does add an extra dependency though.

- [dotenv package for Node.js](https://www.npmjs.com/package/dotenv)
-  See [Python dotenv][] cheatsheet.

[Python dotenv]: {% link cheatsheets/python/configs/dotenv.md %}

## Resources

- [dotenv.org](https://www.dotenv.org/) - sync .env files between machines, environments, and team members
- [Twelve-Factor App: Config](https://12factor.net/config)

