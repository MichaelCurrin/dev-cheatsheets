# Noscript tag

When JavaScript is disabled by the user, or by an adblocker or if the JS is not compatible in a browser, it is a good idea to have a fallback message. The noscript HTML tag can be used to show a message is JS cannot run. This is especially useful if the site looks like a blank page when JS cannot run.

Previously only in the body, it now also works in the head but there it must contain links etc. and not content.

e.g.

```html
<noscript>
    This site requires JavaScript.
</noscript>
```

Alternate messages I've seen:

- You need to enable JavaScript to run this app.
- JavaScript must be enabled to use this feature.
- Twitter:
    > JavaScript is not available.
    > 
    > We’ve detected that JavaScript is disabled in this browser. Please enable JavaScript or switch to a supported browser to continue using twitter.com. You can see a list of supported browsers in our Help Centre.

My own:

- This site is unsupported on your browser. Please enable JavaScript, turn off adblocker for this domain or switch to a different browser.
- This app works best with JavaScript enabled

An idea for another note which also displays when JS is disabled but the site still partially works.

- Notice: While Javascript is not essential for this website, your interaction with the content will be limited. Please turn Javascript on for the full experience


## Resources

- [Don't forget the noscript element](https://webdesign.tutsplus.com/tutorials/quick-tip-dont-forget-the-noscript-element--cms-25498)
- [W3 schools noscript](https://www.w3schools.com/TAGs/tag_noscript.asp)
- [Mozilla noscript](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/noscript)
