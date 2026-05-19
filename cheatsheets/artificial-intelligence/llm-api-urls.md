# LLM API URLs

## URLs

URLs for local LLM APIs and remote API options.

| LLM                 | Protocol | URL                                 |
|---------------------|----------|-------------------------------------|
| OpenAI API          | OpenAI   | `https://api.openai.com/v1/`        |
| Pollinations AI API | Standard | `https://text.pollinations.ai/`     |
| Pollinations AI API | OpenAI   | `https://text.pollinations.ai/openai` |
| LM Studio           | OpenAI   | `http://localhost:1234/v1`          |
| Ollama              | Standard | `http://localhost:11434/api`        |
| Ollama              | OpenAI   | `http://localhost:11434/v1`         |

## Env variable configuration samples

### Pollinations API

```sh
OPENAI_MODEL='openai'
OPENAI_API_KEY='dummy'
OPENAI_API_URL='https://text.pollinations.ai/openai'
```

### LM Studio

```sh
OPENAI_MODEL=''
OPENAI_API_KEY='dummy'
OPENAI_API_URL='http://localhost:1234/v1'
```

### Ollama

```sh
OPENAI_MODEL='llama3.2'
OPENAI_API_KEY='dummy'
OPENAI_API_URL='http://localhost:11434/v1'
```

