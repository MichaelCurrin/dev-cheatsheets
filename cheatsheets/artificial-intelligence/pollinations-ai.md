# Pollinations AI

## About

Free open-source service for AI-generated text and images. Available as an API, without needing authorization.

It runs on their free Google cloud credits. Their docs say they use rate limiting such as 20 requests per minute for the text API, excluding cached responses.

## Links

- [pollinations.ai](https://pollinations.ai/) - includes image generator and samples (including Python with `pollinations` or `requests` or with a React frontend).
- [Repo on GitHub](https://github.com/pollinations/pollinations)
- [React Hooks](https://react-hooks.pollinations.ai/) interactive tool for generating images.


## API requests

See the [API docs](https://github.com/pollinations/pollinations/blob/master/APIDOCS.md)

See sections below for tips on using the text and image endpoints.

The links below will work fine in the browser as `GET` requests but these are intended to handled in a client e.g. using Python or React for building the URL and displaying the content for a user.

### Options

See this page for parameters/options available for endpoints:

- [pollinations-react/README.md](https://github.com/pollinations/pollinations/blob/master/pollinations-react/README.md)

Find what models are available:

- Text [https://text.pollinations.ai/models](https://text.pollinations.ai/models)
- Image [https://image.pollinations.ai/models](https://image.pollinations.ai/models)

### Text endpoint

e.g.

- [https://text.pollinations.ai/A%20beautiful%20bedtime%20story](https://text.pollinations.ai/A%20beautiful%20bedtime%20story)

The text endpoint also includes a path for an API that follows the **OpenAI** specification, so it can be used easily with the `openai` Python/JavaScript packages or Python LangChain's OpenAI connector as covered below.

- `https://text.pollinations.ai/openai`

With `openai`:

```python
from openai import OpenAI

client = OpenAI(base_url="https://text.pollinations.ai/openai", api_key="dummy")
```

With LangChain's [ChatOpenAI](https://python.langchain.com/docs/integrations/chat/openai/):

```python
from langchain_openai import ChatOpenAI

client = ChatOpenAI(ChatOpenAI(
    base_url="https://text.pollinations.ai/openai",
    openai_api_key="dummy",
)
```

### Image endpoint

Use the form on the Pollinations homepage. There is a feed of other users' images and you can edit the prompt or make a new one.

A generated image can be viewed there and the link can be copied for ease, rather than building the URL by hand.

e.g. 

- [https://image.pollinations.ai/prompt/calm%20serene%20forest%20meditation%20session%20in%20an%20eastern%20template%20at%20dawn&nologo=true&model=flux
(https://image.pollinations.ai/prompt/calm%20serene%20forest%20meditation%20session%20in%20an%20eastern%20template%20at%20dawn&nologo=true&model=flux)
