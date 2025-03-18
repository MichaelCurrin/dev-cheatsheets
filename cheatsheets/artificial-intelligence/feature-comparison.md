# Feature comparison

You can choose between plenty of free generative AI tools for completing tasks. But which one has the most complete features when it comes to interacting with voice, accessing documents, or doing internet research? Which ones are strong on generating files and graphs as output?

- [Links to services](#links-to-services)
- [Features](#features)
    - [Notes](#notes)
    - [Free tier limitations](#free-tier-limitations)
- [Try out the features](#try-out-the-features)
    - [Search the web](#search-the-web)
    - [Voice call mode](#voice-call-mode)
    - [AI image generation](#ai-image-generation)
    - [Plugins or extensions](#plugins-or-extensions)
    - [Google Drive access](#google-drive-access)
    - [Dataviz](#dataviz)
    - [Memory about you](#memory-about-you)
- [Privacy warning](#privacy-warning)

## Links to services

- [ChatGPT](https://chatgpt.com/) by OpenAI. Or [Download](https://openai.com/chatgpt/download/) for desktop app.
- [Microsoft Copilot](https://copilot.microsoft). Previously named _Bing Chat_. 
- [Gemini](http://gemini.google.com/) by Google. Previously named _Google Bard_.
- [Claude](https://claude.ai/) by Anthropic.

MS Copilot should not be confused with Microsoft 365 Copilot (formerly office) or Microsoft's coding AIs such as [GitHub Copilot](https://github.com/features/copilot) or the [VS Code Copilot](https://code.visualstudio.com/docs/copilot/overview) extension. MS Copilot can also be accessed via the Copilot sidebar in [MS Edge](https://www.microsoft.com/en-us/edge/download) browser.

## Features

Last updated March 2025, here is what you can do on each platform on the **free tier**.

| Functionality                                        | ChatGPT |       Copilot        |   Google Gemini   |      Claude       |
| ---------------------------------------------------- | :-----: | :------------------: | :---------------: | :---------------: |
| Model used                                           | GPT-4o  | Microsoft Prometheus |    Gemini 2.0     |     Claude3.7     |
| Mobile app available                                 |   ✅    |          ✅          |        ✅         |        ✅         |
| API available                                        |   ✅    |          ✅          |        ✅         |        ✅         |
| Search the web                                       |   ✅    |          ✅          |        ✅         |        ❌         |
| File upload                                          |   ✅    |          ✅          |        ✅         |        ✅         |
| Plugins or extensions                                |   ✅    |          ❌          |        ✅         |        ❌         |
| Google Drive access                                  |   ✅    |          ❌          |        ✅         |        ❌         |
| Text-to-speech output                                |   ✅    |          ✅          |        ✅         |        ❌         |
| Speech recognition                                   |   ✅    |          ✅          |        ✅         | ❌ web, ✅ mobile |
| Voice call mode                                      |   ✅    |          ✅          | ❌ web, ✅ mobile |        ❌         |
| Reasoning (deep think, think before responding)      |   ✅    |          ❌          |        ✅         |        ✅         |
| Generate images with AI                              |   ✅    |          ✅          |        ✅         |        ❌         |
| Create artifacts (output document or code as a file) |   ✅    |          ❌          |        ✅         |        ✅         |
| Live app preview (HTML page in sidepanel)            |   ❌    |          ❌          |        ❌         |        ✅         |
| Dataviz (inline graphs using Python code)            |   ❌    |          ❌          |        ✅         |        ❌         |
| Memory about you                                     |   ✅    |          ❌          |        ✅         |        ❌         |

ChatGPT and Gemini both have the most features on this list, so I'd say use one of those. If you voice call mode on the web, ChatGPT is better. If you want inline Python charts, Gemini has the edge there.

See [Try out the features](#try-out-the-features) below for more details on what these features do and how to access them.

### Notes

- I wrote a [post](https://michaelcurrin.github.io/coding-blog/2023/10/28/ai-tools.html) in 2023 with a table like the above. It's impressive how far these have come, in particular ChatGPT was behind Gemini in a few features and has caught up.
- ChatGPT seems to be the only one with a **desktop app**. See page.
- Google also has [Google AI Studio](https://aistudio.google.com). That is built on Gemini but has a realtime stream mode so you can share your screen or webcam continuously. You use voice mode or text to interact with the AI (unlike in plain Gemini web app which lacks voice mode).
- Claude has no speech recognition for the web app, but the mobile app allows you to record text from a voice clip and send it.
- The model used by MS Copilot is built on GPT-4, according to the [Microsoft Copilot](https://en.wikipedia.org/wiki/Microsoft_Copilot) Wikipedia page.
- Microsoft provides access via API or for an enterprise subscription - see [Azure AI](https://azure.microsoft.com/en-us/solutions/ai/).

### Free tier limitations

- For ChatGPT it will switch to _GTP-4o mini_ after limited _GPT-4o_ interactions.
- Claude stops working completely for a few hours after a few messages. And lists "extended thinking" as a pro feature only.
- Gemini lets you upgrade to get more advanced features and models.

## Try out the features

How to use some of the features in the table above.

### Search the web

Ask for realtime info or about a recent article and look for a URL reference in the answer.

```
What is the weather?
```

### Voice call mode

Icon in ChatGPT web:

<img width="150" alt="image" src="https://github.com/user-attachments/assets/fef4c848-80da-4666-93e4-ce57363a47d4" />

You can customize what the voice sounds like in the settings. ChatGPT so far is all American and Gemini is all British. They also have multilingual support in voice mode, if you want to try asking for tips on learning a language or just start a conversation in another language.

I found Copilot worked great on Chrome but gave an error everytime I started voice mode on Firefox.

### AI image generation

```
make a cute lego model of Amsterdam at twilight. cinematic. realistic. soft focus bokeh
```

ChatGPT result:

<img width="408" alt="image" src="https://github.com/user-attachments/assets/3b13ed2a-a214-4616-a777-6fad0241966d" />

You can follow up to refine the image. e.g.

```
make it nighttime
```

### Plugins or extensions

ChatGPT allows you to use GPTs published by others and to make your own (on premium).

<img width="255" alt="image" src="https://github.com/user-attachments/assets/a3fcb3cd-72e2-4783-b0ee-b380b8c718a6" />

Gemini allows you to interact with Google Drive, Google Maps, YouTube, flight bookings, and more.

<img width="228" alt="image" src="https://github.com/user-attachments/assets/40d1e1d8-bed3-4b28-8961-6f65790c4648" />

### Google Drive access

Search and ask questions about your Google Drive documents.

ChatGPT can connect to Google Drive like this:

<img width="369" alt="image" src="https://github.com/user-attachments/assets/2f785222-6fbf-42bd-a58d-25f848d1ee78" />

Gemini can pick up Google Drive automatically or you can use the "@" mention for Google Drive.

<img width="251" alt="image" src="https://github.com/user-attachments/assets/fabfd595-b510-4f59-8267-18631fc7f977" />

Which one to use? You could use ChatGPT, but your data is going outside of Google for OpenAI to use, so be aware of that risk (such as if OpenAI abuses your data or gets hacked). I consider Gemini safer since it is part of Google already. In both cases, still be careful about discussing any sensitive documents as per [Privacy warning](#privacy-warning).

### Dataviz

From Gemini:

```
get euro vs dollar exchange rate for 2000 to 2025 and graph it.
```

<img width="820" alt="image" src="https://github.com/user-attachments/assets/dad1d2fd-bbbe-461e-8edd-97100ad5a28d" />

Claude can't make Python graphs inline but it can use React to make a graph in the sidepanel.

```
make a graph of compound growth
```

<img width="840" alt="image" src="https://github.com/user-attachments/assets/a3fab692-3816-46f7-a692-c1b454849ccc" />

<img width="838" alt="image" src="https://github.com/user-attachments/assets/38ba0e7b-03c9-4a68-b498-962b33a42287" />

### Memory about you

Given an instruction like: "Always give me vegetarian or pescatarian recipes.".

For Gemini:

<img width="845" alt="image" src="https://github.com/user-attachments/assets/1388e127-7931-48fc-9bf2-20341579b0dd" />

For ChatGPT:

<img width="821" alt="image" src="https://github.com/user-attachments/assets/aa14e6f9-9ab7-4412-8199-95ff0b7736c4" />

For ChatGPT, you can also go into Settings then Personalisation to write instructions and info about yourself. That is also where you can _clear_ memories it has about you which are not accurate or useful.


## Privacy warning

This goes for the memory feature but also general cahts.

Be careful about sharing **private or sensitive info** in the chats. 

Chats can be used for training of models and also for **human review** in the case of Gemini. 

You can use the "Temporary chat", turn off "Memory", or opt for paid subscription approaches, but there's still a possibility that the companies will store data about you.
