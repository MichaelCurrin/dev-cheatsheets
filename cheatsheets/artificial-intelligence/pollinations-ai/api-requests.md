# API requests

See the [API docs](https://github.com/pollinations/pollinations/blob/master/APIDOCS.md). 

See sections below for tips on using the text and image endpoints.

Notes:

- The links below will work fine in the browser as `GET` requests but these are intended to handled in a client e.g. using Python or React for building the URL and displaying the content for a user.
- If you use Firefox rather than CHrome, the percent encoding is rendered as a space, so that's easy to read. Or you can type an underscore for a space to keep it readable.

## Text endpoint - basic

See models here: [text.pollinations.ai/models](https://text.pollinations.ai/models).

Add your prompt in the URL and get back the result as plain text.

e.g.

- [https://text.pollinations.ai/A%20beautiful%20bedtime%20story](https://text.pollinations.ai/A%20beautiful%20bedtime%20story)

### Query parameters

Optionally add URL params:

- GET - `prompt*`, `model`, `seed`, `json`, `system`
- POST - `messages*` (can include system prompt), `model`, `seed`, `jsonMode`

See explanations in the [Text API](https://github.com/pollinations/pollinations/blob/master/APIDOCS.md#text-generation-api) docs.

## Text endpoint following OpenAI protocol

The text endpoint also includes a path for an API that follows the **OpenAI** specification, so it can be used easily with the `openai` Python/JavaScript packages or Python LangChain's OpenAI connector as covered below.

- `https://text.pollinations.ai/openai`

With the [openai](https://pypi.org/project/openai/) Python package:

```python
from openai import OpenAI

client = OpenAI(base_url="https://text.pollinations.ai/openai", api_key="dummy")
```

With the [langchain-openai](https://pypi.org/project/langchain-openai/) package's [ChatOpenAI](https://python.langchain.com/docs/integrations/chat/openai/) class:

```python
from langchain_openai import ChatOpenAI

client = ChatOpenAI(base_url="https://text.pollinations.ai/openai", openai_api_key="dummy")
```


## Image endpoint

Use the form on the Pollinations homepage. There is a feed of other users' images and you can edit the prompt or make a new one.

A generated image can be viewed there and the link can be copied for ease, rather than building the URL by hand.

e.g. [image.pollinations.ai/prompt/calm%20serene%20forest...&nologo=true&model=flux](https://image.pollinations.ai/prompt/calm%20serene%20forest%20meditation%20session%20in%20an%20eastern%20temple%20at%20dawn&nologo=true&model=flux)

![Image](https://image.pollinations.ai/prompt/calm%20serene%20forest%20meditation%20session%20in%20an%20eastern%20temple%20at%20dawn&nologo=true&model=flux)

### Query parameters

See [Image options](https://github.com/pollinations/pollinations/blob/master/APIDOCS.md#image-generation-api) in the API docs.

See models here: [image.pollinations.ai/models](https://image.pollinations.ai/models).

See the [pollinations-react/README.md](https://github.com/pollinations/pollinations/blob/master/pollinations-react/README.md) for info on using with React and for explanations of parameters (note the parameters are for the React implementation and not necessarily the URL query params but are still explained well).
