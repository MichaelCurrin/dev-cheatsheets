# Dotenv file


## Introduction

A `.env` file is a configuration file used to store environment variables. It's commonly used in development to keep sensitive information (like API keys) out of source code.

It must be a valid shell script (usually Bash).

## Cheatsheet

### Basic Usage

- Create a file named `.env` in your project's root directory.
- Add variables in `KEY=VALUE` format, one per line. 
- Access variables in your code using `process.env.KEY` (Node.js) or similar methods in other languages

### Top Tips

1. Never commit `.env` files to version control
2. Use `.env.example` to share template of required variables.
3. Load `.env` files as early as possible in your application.
4. Use different `.env` files for different environments (e.g., `.env.development`, `.env.production`)
5. Validate required environment variables on startup.

### Syntax

- No spaces around `=` sign: `API_KEY=abcdef123456`
- Use quotes for values with spaces: `MESSAGE="Hello World"`
- Multi-line values:
  ```
  MULTI_LINE="line 1
  line 2"
  ```


## Sample

```sh
# Database Configuration
DB_HOST=localhost
DB_PORT=5432
DB_NAME=myapp_database
DB_USER=admin
DB_PASSWORD=super_secret_password

# API Keys
STRIPE_API_KEY=sk_test_4eC39HqLyjWDarjtT1zdp7dc
MAILGUN_API_KEY=key-3ax6xnjp29jd6fds4gc373sgvjxteol0

# Application Settings
APP_ENV=development
DEBUG_MODE=true
LOG_LEVEL=info

# Server Configuration
PORT=3000
HOST=0.0.0.0

# Feature Flags
ENABLE_NEW_FEATURE=false

# External Service URLs
API_URL=https://api.example.com/v1
WEBHOOK_URL=https://webhook.site/1234abcd-5678-90ef-ghij-klmnopqrstuv

# Secrets
JWT_SECRET=my_super_secret_jwt_token_do_not_share

# Multi-line Value Example
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

### Automatically

Use a package that can read the `.env` file when your app starts. This does add an extra dependency though.

- [dotenv package for Node.js](https://www.npmjs.com/package/dotenv)
- [python-dotenv for Python](https://pypi.org/project/python-dotenv/)

## Resources

- [dotenv.org](https://www.dotenv.org/) - sync .env files between machines, environments, and team members
- [Twelve-Factor App: Config](https://12factor.net/config)
