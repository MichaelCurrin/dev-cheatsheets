---
title: Dotenv file
description: |
  A `.env` file is a simple text file used to store environment variables for an application.
---

A `.env` file is a configuration file used to store environment variables, typically as a file in the project root. It's commonly used in development to keep sensitive information (like API keys) out of source code. 

This is similar to `config.properties` in Java - see [article](https://www.baeldung.com/java-properties).


## Basic usage

- Create a file named `.env` in your project's root directory.
- Add variables in `KEY=VALUE` format, one per line. 
- Access variables in your code using `process.env.KEY` (Node.js) or similar methods in other languages

## Top tips

- The contents of the file are not encrypted, so it should be kept private and not shared with others.
- Never commit `.env` files to version control. Or only if there are no sensitive secrets in them.
- Use `.env.template` to share template of required variables.
- Load `.env` files as early as possible in your application.
- Validate required environment variables on startup.
- You can use different `.env` files for different environments (e.g. `.env.development`, `.env.production`). Though you could set those variables instead as environment variables in your build pipeline such that as dotenv file is not needed in a deploymed environment.

## Syntax

- It must be a valid shell script (usually Bash).
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

Run this in Bash to read the contents of the file and then set each as exported variables with `export`:

```sh
$ export $(< .env)
```

Or this (**Warning**: This does **not** work well with comments in a file, it will attempt to evaluate the comment and ignore the `#` symbol).

```sh
$ export $(xargs < .env)
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

### Node

See [dotenv package for Node.js](https://www.npmjs.com/package/dotenv)

- Install the package in your project with:
    ```sh
    $ npm install --save-dev dotenv
    ```
- Load environment variables from the ".env" file with:
    ```sh
    $ dotenv -e .env
    ```
- Test with this in a JS script:
    ```js
    console.log(process.env.API_KEY)
    ```
    
### Python

See [Python dotenv][] cheatsheet.

[Python dotenv]: {% link cheatsheets/python/configs/dotenv.md %}

## Resources

- [dotenv.org](https://www.dotenv.org/) - sync .env files between machines, environments, and team members
- [Twelve-Factor App: Config](https://12factor.net/config)

