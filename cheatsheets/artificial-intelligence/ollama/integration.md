---
title: Integration
description: How to integrate the running Ollama service in your application
---

## Ollama API

Using `/api`.

### Use LangChain

```python
from langchain_ollama.llms import OllamaLLM
```

### Use Ollama package

See [ollama-python](https://github.com/ollama/ollama-python) on GitHub.

```python
import ollama

response = ollama.chat(model='llama3.1', messages=[
  {
    'role': 'user',
    'content': 'Why is the sky blue?',
  },
])
print(response['message']['content'])
```

### Use cURL

Based on the [Ollama docs](https://github.com/ollama/ollama?tab=readme-ov-file#rest-api):

```sh
curl http://localhost:11434/api/generate -d '{
  "model": "llama3.1",
  "prompt":"Why is the sky blue?"
}'
```

## OpenAI style

Using `/v1`.

Connect to Ollama's OpenAI-compliant API with this URL:

```
http://localhost:11434/v1
```

From [OpenAI compatibility](https://ollama.com/blog/openai-compatibility).

This means you can use LangChain or the OpenAI package and just configure with that URL.

### Use OpenAI package

```python
from openai import OpenAI

client = OpenAI(
    base_url = 'http://localhost:11434/v1',
    api_key='dummy',
)
```

### Use cURL

```sh
curl http://localhost:11434/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "llama3.2",
        "messages": [
            {
                "role": "system",
                "content": "You are a helpful assistant."
            },
            {
                "role": "user",
                "content": "Hello!"
            }
        ]
    }'
```
