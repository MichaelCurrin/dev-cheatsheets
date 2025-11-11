# Export chat
> Use JS to get messages in the chat and copy so you can add it to a new chat

Get the chat as a single variable then copy to the clipboard. 

## Gemini

Note this excludes images and codeblocks are included as plain text without indicating start and end.

```javascript
var chatHistory = document.querySelectorAll('.conversation-container user-query, .conversation-container model-response');
var chatData = Array.from(chatHistory).map(element => ({
    type: element.tagName === 'USER-QUERY' ? 'USER' : 'AI_ASSISTANT',
    content: element.textContent.trim()
}));
var allText = chatData.map(e => `${e.type}: '''${e.content}'''`).join('\n\n');
var dummy = document.createElement("textarea");
document.body.appendChild(dummy);
dummy.value = allText;
dummy.select();
document.execCommand("copy");
document.body.removeChild(dummy);
```

Now you have the messages on your clipboard.

Sample output:

```
USER: '''first message'''

AI_ASSISTANT: '''first response'''

USER: '''second message'''

AI_ASSISTANT: '''second response'''
```
