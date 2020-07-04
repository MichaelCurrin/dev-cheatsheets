---
title: OG tags
---

## Resources

- [Open Graph Protocol](https://ogp.me/) homepage
- [A Guide to Sharing for Webmasters](https://developers.facebook.com/docs/sharing/webmasters) on FB's dev docs. See tag type and examples
- [Sharing Debugger](https://developers.facebook.com/tools/debug/( - requires signing into Facebook
- [Twitter card validator](https://cards-dev.twitter.com/validator)


## Tags

### Type

`og:type`

- Defaults to `website` if not set, though this could be set explicitly to avoid SEO tool errors.
- There can only be one.
- See [Types](https://ogp.me/#types) reference. This covers articles, music, videos, etc.

### Image


`og:image`

- URL for the image.
- > To update an image after it's been published, use a new URL for the new image. Images are cached based on the URL and won't be updated unless the URL changes.

## Sample from docs

```html
<meta  property="og:url"  content="http://www.nytimes.com/2015/02/19/arts/international/when-great-minds-dont-think-alike.html"  />
<meta  property="og:type"  content="article"  />
<meta  property="og:title"  content="When Great Minds Don’t Think Alike"  />
<meta  property="og:description"  content="How much does culture influence creative thinking?"  />
<meta  property="og:image"  content="http://static01.nyt.com/images/2015/02/19/arts/international/19iht-btnumbers19A/19iht-btnumbers19A-facebookJumbo-v2.jpg"  />
```

## My sample



### Result

| Tag            | Value                                                          |
| -------------- | -------------------------------------------------------------- |
| og:url         | https://thebuckfeverunderground.co.za/                         |
| og:title       | The Buckfever Underground                                      |
| og:description | Spoken-word experimental rock band in Cape Town, South Africa. |
| og:locale      | en_US                                                          |
| og:site_name   | The Buckfever Underground                                      |

### Input

```html
<title>The Buckfever Underground | Spoken-word experimental rock band in Cape Town, South Africa.</title>
<meta property="og:title" content="The Buckfever Underground" />
<meta property="og:locale" content="en_US" />

<meta name="description" content="Spoken-word experimental rock band in Cape Town, South Africa." />
<meta property="og:description" content="Spoken-word experimental rock band in Cape Town, South Africa." />

<link rel="canonical" href="https://thebuckfeverunderground.co.za/" />
<meta property="og:url" content="https://thebuckfeverunderground.co.za/" />
<meta property="og:site_name" content="The Buckfever Underground" />
```
