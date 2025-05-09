# Pollinations AI

A free no-authentication but rate-limited AI service available as an AI. Performance is not guaranteed and does not scale well (it is limited by IP), but for small apps and prototypes or running for yourself on your machine it is fine.

### Use cases

- Try out directly with Postman or browser, no coding.
- Make a local backend or CLI tool that requests text or images, try out various settings. You could also use Ollama for local models but that's an extra setup step including downloading of models and they are limited by your machine's memory.
- Make a JS-based frontend app which requests an AI service. Does not require an API key, while using OpenAI API with API key in your code would be a security risk and can get abused, or you let users put in their own key which is a barrier for users and also means some users will fear their key is leaked. Also does not require to put your AI service as as a backend (a server or serverless instance in the cloud) or a wrapper on a service with the key, you just make your frontend locally or on GitHub Pages or another site and deploy.

### Links

- [pollinations.ai](https://pollinations.ai/) - includes image generator and samples (including Python with `pollinations` or `requests` or with a React frontend). Their website looks unprofessional like they use AI to generate text on the site (including logos with typos half the time and even their Terms and Conditions page is AI-generated).
- [Repo on GitHub](https://github.com/pollinations/pollinations)
- [React Hooks](https://react-hooks.pollinations.ai/) interactive tool for generating images.
