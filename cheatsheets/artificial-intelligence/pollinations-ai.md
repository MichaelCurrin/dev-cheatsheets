# Pollinations AI

Free open-source service for AI-generated text and images. Available as an API, without needing authorization.

It runs on their free Google cloud credits. Their docs say they use rate limiting such as 20 requests per minute for the text API, excluding cached responses.

## About

- [pollinations.ai](https://pollinations.ai/) - includes image generator and samples (including Python with `pollinations` or `requests` or with a React frontend).
- [Repo](https://github.com/pollinations/pollinations)
- [API docs](https://github.com/pollinations/pollinations/blob/master/APIDOCS.md)
- [React Hooks](https://react-hooks.pollinations.ai/) interactive tool 

## API

See the API docs linked above.

They have an API for text and one for images. The text one includes a path for an API that follows the OpenAI specification, so it can be used easily with the `openai` package or LangChain's OpenAI connector.

- [https://text.pollinations.ai/openai](https://text.pollinations.ai/openai)

## Browser-based

Easy access in the browser without an APi client

See this page for parameters/options available:

- [pollinations-react/README.md](https://github.com/pollinations/pollinations/blob/master/pollinations-react/README.md)

### Models

- Text [https://text.pollinations.ai/models](https://text.pollinations.ai/models)
- Image [https://image.pollinations.ai/models](https://image.pollinations.ai/models)

### Text

e.g.

[https://text.pollinations.ai/A%20beautiful%20bedtime%20story
](https://text.pollinations.ai/A%20beautiful%20bedtime%20story)

### Images

Use the form on the Pollinations homepage. There is a feed of other users' images and you can edit the prompt or make a new one.

A generated image can be viewed there and the link can be copied for easy.

e.g.

[https://image.pollinations.ai/prompt/calm%20serene%20forest%20meditation%20session%20in%20an%20eastern%20template%20at%20dawn&nologo=true&model=flux
](https://image.pollinations.ai/prompt/calm%20serene%20forest%20meditation%20session%20in%20an%20eastern%20template%20at%20dawn&nologo=true&model=flux
)
