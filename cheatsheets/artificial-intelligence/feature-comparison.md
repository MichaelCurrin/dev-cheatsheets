# Feature comparison

You can choose between plenty of free generative AI tools for completing tasks. But which one has the most complete features when it comes to interacting with voice, accessing documents, or doing internet research? Which ones are strong on generating files and graphs as output?

<!-- 
Related pages
- https://dev.to/michaelcurrin/feature-comparison-of-popular-genaillm-platforms-2jai 
- https://github.com/MichaelCurrin/coding-blog/blob/master/_posts/2025-03-18-features-of-popular-geni-platforms-in-2025.md 
-->

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
    - [Live app preview](#live-app-preview)
    - [Dataviz](#dataviz)
    - [Memory about you](#memory-about-you)
- [Privacy warning](#privacy-warning)

## Links to services

Here are the 4 platforms I'm comparing on this page and links where you access them.

- [ChatGPT](https://chatgpt.com/) by OpenAI. Or [Download](https://openai.com/chatgpt/download/) the desktop app.
- [Microsoft Copilot](https://copilot.microsoft). Previously named _Bing Chat_. Or go to [Download for macOS](https://apps.apple.com/ca/app/microsoft-copilot/id6738511300?mt=12) or [Windows download](https://apps.microsoft.com/detail/9nht9rb2f4hd?hl=en-us&gl=US) for desktop.
- [Gemini](http://gemini.google.com/) by Google. Previously named _Google Bard_.
- [Claude](https://claude.ai/) by Anthropic. Or [Download](https://claude.ai/download) the desktop app.

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
| Canvas/artifacts (output document or code as a file) |   ✅    |          ❌          |        ✅         |        ✅         |
| Live app preview (HTML page in sidepanel)            |   ✅    |          ❌          |        ❌         |        ✅         |
| Dataviz (inline graphs using Python code)            |   ✅    |          ❌          |        ✅         |        ❌         |
| Memory about you                                     |   ✅    |          ❌          |        ✅         |        ❌         |

ChatGPT and Gemini have the most complete set of features on this list and have generous free tiers, so I'd say use one of those as a start. But you might find it worthwhile to try out the other platforms either to switch to them or just to use them when you need that feature.

See [Try out the features](#try-out-the-features) below for more details on what these features do and how to access them.

### Notes

- I wrote a [post](https://michaelcurrin.github.io/coding-blog/2023/10/28/ai-tools.html) in 2023 with a table like the above. It's impressive how far these have come, in particular ChatGPT was behind Gemini in a few features and has caught up.
- Google also has [Google AI Studio](https://aistudio.google.com). That is built on Gemini but has a realtime stream mode so you can share your screen or webcam continuously. You use voice mode or text to interact with the AI (unlike in plain Gemini web app which lacks voice mode).
- Claude has no speech recognition for the web app, but the mobile app allows you to record text from a voice clip and send it.
- The model used by MS Copilot is built on GPT-4, according to the [Microsoft Copilot](https://en.wikipedia.org/wiki/Microsoft_Copilot) Wikipedia page.
- Microsoft provides access via API or for an enterprise subscription - see [Azure AI](https://azure.microsoft.com/en-us/solutions/ai/).

### Free tier limitations

- For ChatGPT it will switch to _GTP-4o mini_ after a limited number of _GPT-4o_ interactions.
- I don't know limits of MS Copilot but here are benefits of subscribing based on their [blog post](https://www.microsoft.com/en-us/microsoft-copilot/blog/2025/02/25/announcing-free-unlimited-access-to-think-deeper-and-voice/?msockid=32f0212a57186508386734be565264d7):
    > Copilot Pro users will retain preferred access to our latest models during peak usage, early access to experimental AI features (more on that coming soon), and additional use of Copilot in select Microsoft 365 apps like Word, Excel and PowerPoint.
- Gemini seems to do well on the free tier, I don't know if it switches to another model after so many messages. Gemini lets you upgrade to Gemini Advanced to get more features and models.
- Claude stops working completely for a few hours after a few messages. And lists "extended thinking" as a pro feature only.

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

You can customize what the voice sounds like in the settings. 

They also have multilingual support in voice mode, if you want to try asking for tips on learning a language or just start a conversation in another language.

I found Copilot worked great on Chrome desktop or the mobile app, but gave an error everytime I started voice mode on Firefox.

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

### Live app preview

Make websites and graphs using React or HTML/CSS/JS.

```
make a graph of compound growth
```

In ChatGPT, after adding a follow-up prompt "add labels for inputs".

Click on the code block to expand it:

<img width="798" alt="image" src="https://github.com/user-attachments/assets/3b063fc5-2636-4be7-b3a7-1f6cd62eaa0d" />

Then click Preview.


<img width="373" alt="image" src="https://github.com/user-attachments/assets/9664d1f6-0e09-4419-b1b7-7a955669b300" />


<img width="820" alt="image" src="https://github.com/user-attachments/assets/061f5a49-bc4d-4a1d-a9d6-357c8a390158" />


In Claude:

<img width="838" alt="image" src="https://github.com/user-attachments/assets/38ba0e7b-03c9-4a68-b498-962b33a42287" />

<img width="840" alt="image" src="https://github.com/user-attachments/assets/a3fab692-3816-46f7-a692-c1b454849ccc" />



### Dataviz

From Gemini:

```
get euro vs dollar exchange rate for 2000 to 2025 and graph it.
```

<img width="820" alt="image" src="https://github.com/user-attachments/assets/dad1d2fd-bbbe-461e-8edd-97100ad5a28d" />

For ChatGPT, it took a follow-up prompt to get the table output as a graph:

```
graph this data with python
```

<img width="787" alt="image" src="https://github.com/user-attachments/assets/79c1d22e-4905-4ef2-8c5e-4da5e4fb15f2" />

I had to ask for the code directly.

```
give me the code
```

Alternativly you can update _Settings_ to always output code.

<img width="491" alt="image" src="https://github.com/user-attachments/assets/e6e00f88-ebfa-41fb-9768-82e24c285216" />


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
