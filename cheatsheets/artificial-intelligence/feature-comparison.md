# Feature comparison

A comparison of popular LLM tools and what their capabilities are, so you can pick one or more for your needs. Only the generic tools are covered here, not specialized tools like the AI coding assistants.

## Links

- [ChatGPT](https://chatgpt.com/) by OpenAI.
- [Microsoft Copilot](https://copilot.microsoft) or Copilot sidebar in Edge browser or [Azure AI](https://azure.microsoft.com/en-us/solutions/ai/) for API. Previously named _Bing Chat_.
- [Gemini](http://gemini.google.com/) by Google. Previously named "Google Bard".
- [Claude](https://claude.ai/) by Anthropic.

## Features

Last updated March 2025, here is what you can do on each platform on the **free tier**.

| Functionality                                 | ChatGPT | Copilot | Google Gemini | Claude    |
| --------------------------------------------- | :-----: | :-----: | :-----------: | :-------: |
| Model used                                    | GPT-4o  | Microsoft Prometheus    | Gemini 2.0    | Claude3.7 |
| Mobile app available                          | ✅      | ✅      | ✅            | ✅        |
| API available                                 | ✅      | ✅      | ✅            | ✅        |
| Search the web                                | ✅      | ✅      | ✅            | ❌        |
| File upload                                   | ✅      | ✅      | ✅            | ✅        |
| Plugins and extensions                            | ✅      | ❌      | ✅            | ❌        |
| Google Drive access                           | ✅      | ❌      | ✅            | ❌        |
| Text-to-speech output                         | ✅      | ✅      | ✅            | ❌        |
| Speech recognition                            | ✅      | ✅      | ✅            | ❌        |
| Voice call mode                               | ✅      | ✅      | ❌ web ✅ desktop           | ❌        |
| Reasoning (deep think, think before responding)  | ✅      | ❌      | ✅            | ✅        |
| AI image generation                           | ✅      | ✅      | ✅            | ❌        |
| Create artifacts (document or code as a file) | ✅      | ❌      | ✅            | ✅        |
| Live app preview (HTML page in sidepanel)     | ❌      | ❌      | ❌            | ✅        |
| Dataviz (inline graphs using Python code)     | ❌      | ❌      | ✅            | ❌        |
| Memory about you                              | ✅      | ❌      | ✅            | ❌        |

Notes:

- The model used by Microsoft Copilot is built on GPT-4, according to the [Microsoft Copilot](https://en.wikipedia.org/wiki/Microsoft_Copilot) Wikipedia page.
- ChatGPT seems to be the only one with a **desktop app**. See [Download](https://openai.com/chatgpt/download/) page.
- Claude lacks speech recognition for the web app but the mobile app allows you to record a clip of text and send it.
- Microsoft Copilot should not be confused with Microsoft 365 Copilot or GitHub Copilot or the VS Code Copilot Extension.

## Free tier limitations

- For ChatGPT it will switch to _GTP-4o mini_ after limited _GPT-4o_ interactions.
- Claude stops working completely for a few hours after a few messages. And lists "extended thinking" as a pro feature only.
- Gemini lets you upgrade to get more advanced features and models.

## Try out the features

Prompts to get you started.

### Search the web

Ask for realtime info or about a recent article and look for a URL reference in the answer.

```
What is the weather?
```

### Voice call mode

Icon in ChatGPT web:

<img width="150" alt="image" src="https://github.com/user-attachments/assets/fef4c848-80da-4666-93e4-ce57363a47d4" />

You can customize what the voice sounds like in the settings. ChatGPT so far is all American and Gemini all British. They also have multilingual support in voice mode, if you want to try asking for tips on learning a language or just start a conversation in another language.

### AI image generation

```
make an image of a sunny day in amsterdam, realistic
```

ChatGPT result:

<img width="425" alt="image" src="https://github.com/user-attachments/assets/3f1a3c2c-c472-491d-a396-f1546e8c2c82" />

Gemini result:

<img width="481" alt="image" src="https://github.com/user-attachments/assets/b162e089-c1d1-4474-a388-6b7ac7f6ff84" />

You can follow up to refine the image. e.g.

```
make it nighttime
```

## Plugins and extensions

ChatGPT allows you to use GPTs published by others and to make your own (on premium).

Gemini allows you to interact with Google Drive, Google Maps, YouTube, flight bookings, and more.

## Google Drive access

How to access storage.

ChatGPT can connect to Google Drive and OneDrive with the "+" plus options.

<img width="369" alt="image" src="https://github.com/user-attachments/assets/2f785222-6fbf-42bd-a58d-25f848d1ee78" />

Gemini can pick up Google Drive automatically or you can use the "@" mention for Google Drive.

<img width="251" alt="image" src="https://github.com/user-attachments/assets/fabfd595-b510-4f59-8267-18631fc7f977" />

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


## Memory about you

Given an instruction like: "Always give me vegetarian or pescatarian recipes.".

For Gemini:

<img width="845" alt="image" src="https://github.com/user-attachments/assets/1388e127-7931-48fc-9bf2-20341579b0dd" />

For ChatGPT:

<img width="821" alt="image" src="https://github.com/user-attachments/assets/aa14e6f9-9ab7-4412-8199-95ff0b7736c4" />

For ChatGPT, you can also go into Setitngs and Personalisation to give instructions. That is also where you can clear memories it has about you - sometimes you don't intend for ChatGPT to add something to the memory such as if you are looking for something on behalf of a friend.
