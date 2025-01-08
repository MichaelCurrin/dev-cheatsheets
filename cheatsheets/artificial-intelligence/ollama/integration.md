---
title: Integration
description: How to integrate the running Ollama service in your application
---


## Use LangChain

```python
from langchain_ollama.llms import OllamaLLM
```

## Use Ollama package

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

## Use cURL

Based on the [Ollama docs](https://github.com/ollama/ollama?tab=readme-ov-file#rest-api):

```sh
curl http://localhost:11434/api/generate -d '{
  "model": "llama3.1",
  "prompt":"Why is the sky blue?"
}'
```
