# Ollama

## Install

See [Downloads](https://ollama.com/download) page.

On macOS, install with `brew` using the command here - [formulae.brew.sh/cask/ollama](https://formulae.brew.sh/cask/ollama).


## Usage

### Download models

```sh
$ ollama pull llama3.1
```

### Start interactive CLI

See [Model library](https://github.com/ollama/ollama?tab=readme-ov-file#model-library) in the GitHub docs for models and CLI commands to download.

e.g.

```sh
$ ollama run llama3.1
```

### Run a single query

Pass as an argument e.g.

```console
> ollama run llama3.1 'Tell me a joke'
Here's one:

What do you call a fake noodle?

An impasta.

I hope that made you laugh! Do you want to hear another one?
```

### Access via HTTP

When a model is requested, it will be loaded and used.

Then you can find it under running models here:

```sh
$ ollama ps
```

## Stop

See conversation on GitHub [here](https://github.com/ollama/ollama/issues/690). There is no builtin way to stop `ollama`. Use your system manager or use `pkill`.

On macOS, find the icon as running apps and click Quit.
