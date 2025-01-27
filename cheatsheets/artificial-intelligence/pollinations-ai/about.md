# About

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