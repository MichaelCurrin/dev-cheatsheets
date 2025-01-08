# CLI

## Download models

```sh
$ ollama pull llama3.1
```

## Start interactive CLI

See [Model library](https://github.com/ollama/ollama?tab=readme-ov-file#model-library) in the GitHub docs for models and CLI commands to download.

e.g.

```sh
$ ollama run llama3.1
```

## Run a once-off request

Pass as an argument e.g.

```sh
$ ollama run llama3.1 'Tell me a joke'
```

Read a text file:

```sh
$ ollama run --nowordwrap llama3.1 "Summarize this file in one sentence: $(cat file.txt)"
```

Read an image file such as with `bakllava` or `llava` image models:

```sh
$ ollama run --nowordwrap bakllava "What's in this image? ./photo.jpg"
```


## Access via HTTP

When a model is requested, it will be loaded and used.

Then you can find it under running models here:

```sh
$ ollama ps
```

## Stop

See conversation on GitHub [here](https://github.com/ollama/ollama/issues/690). There is no builtin way to stop `ollama`. Use your system manager or use `pkill`.

On macOS, find the icon as running apps and click Quit.

If you started with `ollam serve`, then just stop that process to stop Ollama.
