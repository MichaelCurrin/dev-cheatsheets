# Pollinations AI

## About

A free open-source service for AI-generated text and images. 

Why use it:

- Available as as a browser tool with a GUI for some use cases.
- Available as an API, accessible in your browser or with a client e.g. Python or JavaScript.
- Cloud-based (so you can use models without worrying about the specs of your machine, the hassle of setting up a local LLM, or applying for access to a model like Llama which now has a strict approval process by Meta).
- It is free (no need for subscription with ChatGPT etc.).
- Works without needing any authorization (i.e. no need to create an account or configure an API key).
- Good documentation available, plus this page fills in the gaps.
- Experiment with various text and image models easily. 

What to use it for:

- Great for prototyping server-side or frontend apps.
- For local use (e.g. an app for yourself).
- For running an app in the cloud and sharing with other users. 

Scaling limitations:

- They say their service runs on free Google cloud credits.
- Their docs say they apply rate limiting, such as 20 requests per minute for the text API, excluding cached responses.
    - I find this less restrictive than the HuggingFace website's free tier.
    - For simple and light use cases, this might be enough, but otherwise you or your end-users might run into issues and you're better off using a paid service.

Remember that unlike a local LLM, your data is travelling across the internet. Do not send sensitive or personal data or IP to their service.

## Links

- [pollinations.ai](https://pollinations.ai/) - includes image generator and samples (including Python with `pollinations` or `requests` or with a React frontend). Their website looks unprofessional like they use AI to generate text on the site (including logos with typos half the time and even their Terms and Conditions page is AI-generated).
- [Repo on GitHub](https://github.com/pollinations/pollinations)
- [React Hooks](https://react-hooks.pollinations.ai/) interactive tool for generating images.


## API requests

See the [API docs](https://github.com/pollinations/pollinations/blob/master/APIDOCS.md)

See sections below for tips on using the text and image endpoints.

Notes:

- The links below will work fine in the browser as `GET` requests but these are intended to handled in a client e.g. using Python or React for building the URL and displaying the content for a user.
- If you use Firefox rather than CHrome, the percent encoding is rendered as a space, so that's easy to read. Or you can type an underscore for a space to keep it readable.

### Text endpoint

e.g.

- [https://text.pollinations.ai/A%20beautiful%20bedtime%20story](https://text.pollinations.ai/A%20beautiful%20bedtime%20story)

The text endpoint also includes a path for an API that follows the **OpenAI** specification, so it can be used easily with the `openai` Python/JavaScript packages or Python LangChain's OpenAI connector as covered below.

- `https://text.pollinations.ai/openai`

With the [openai](https://pypi.org/project/openai/) package:

```python
from openai import OpenAI

client = OpenAI(base_url="https://text.pollinations.ai/openai", api_key="dummy")
```

With the [langchain-openai](https://pypi.org/project/langchain-openai/) package and [ChatOpenAI](https://python.langchain.com/docs/integrations/chat/openai/) class:

```python
from langchain_openai import ChatOpenAI

client = ChatOpenAI(base_url="https://text.pollinations.ai/openai", openai_api_key="dummy")
```

### Image endpoint

Use the form on the Pollinations homepage. There is a feed of other users' images and you can edit the prompt or make a new one.

A generated image can be viewed there and the link can be copied for ease, rather than building the URL by hand.

e.g. [image.pollinations.ai/prompt/calm%20serene%20forest...&nologo=true&model=flux](https://image.pollinations.ai/prompt/calm%20serene%20forest%20meditation%20session%20in%20an%20eastern%20template%20at%20dawn&nologo=true&model=flux)

![Image](https://image.pollinations.ai/prompt/calm%20serene%20forest%20meditation%20session%20in%20an%20eastern%20template%20at%20dawn&nologo=true&model=flux)

### Options for endpoints

See this page for parameters/options available for endpoints:

- [pollinations-react/README.md](https://github.com/pollinations/pollinations/blob/master/pollinations-react/README.md)

For `model`, see what models are available:

- Text [https://text.pollinations.ai/models](https://text.pollinations.ai/models)
- Image [https://image.pollinations.ai/models](https://image.pollinations.ai/models)
