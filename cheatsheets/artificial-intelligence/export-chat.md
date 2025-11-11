# Export chat
> Use JS to get messages in the chat and copy it

Get the chat as a single variable then copy to the clipboard. So you can add it to a new chat or in a different platform.

## Gemini

Open up a chat in Gemini, copy the script below into your JS console, and then you can paste the text where you want.

Note this excludes images and codeblocks are included as plain text without indicating start and end.

```javascript
// Extract history and put together as one message.
var chatHistory = document.querySelectorAll('.conversation-container user-query, .conversation-container model-response');
var chatData = Array.from(chatHistory).map(element => ({
    type: element.tagName === 'USER-QUERY' ? 'USER' : 'AI_ASSISTANT',
    content: element.textContent.trim()
}));
var allText = chatData.map(e => `${e.type}: '''${e.content}'''`).join('\n\n');
// Copy to clipboard.
var dummy = document.createElement("textarea");
document.body.appendChild(dummy);
dummy.value = allText;
dummy.select();
document.execCommand("copy");
document.body.removeChild(dummy);
```

Sample output:

```
USER: '''first message'''

AI_ASSISTANT: '''first response'''

USER: '''second message'''

AI_ASSISTANT: '''second response'''
```
