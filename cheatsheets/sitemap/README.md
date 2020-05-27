# Sitemap cheatsheet

## Basic

What is a sitemap and do you need one?

[Learn about sitemaps](https://support.google.com/webmasters/answer/156184?hl=en)


## Sitemap formats

https://support.google.com/webmasters/answer/183668?hl=en

- XML
- RSS, mRSS, and Atom 1.0
- Text
- Google sites


## How to

### Build

https://support.google.com/webmasters/answer/183668?hl=en

Build and submit a sitemap:

1. Decide which pages on your site should be crawled by Google, and determine the canonical version of each page. 
1. Decide which sitemap format you want to use. You can create your sitemap manually or choose from a number of third-party tools to generate your sitemap for you.
1. Make your sitemap available to Google by adding it to your robots.txt file or directly submitting it to Search Console.

See sitemap generator tools

- https://www.xml-sitemaps.com/


### General guidelines

See *General sitemap guidelines* section.

https://support.google.com/webmasters/answer/183668?hl=en



### Languages

See [Tell Google about localized versions of your page](https://support.google.com/webmasters/answer/189077#sitemap)


## Sitemaps protocol

https://www.sitemaps.org/protocol.html

### Fields

- `loc` - e.g.  `http://www.example.com/`, `http://www.example.com/catalog?item=12&amp;desc=vacation_hawaii`
- `lastmod` - e.g. `2020-03-04`
- `changefreq`  - e.g. `monthly`

Priority is dropped from the examples.

> Google does not currently consume the `<priority>` attribute in sitemaps. [source](https://support.google.com/webmasters/answer/183668?hl=en)

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE4NjgzMTc3NzJdfQ==
-->