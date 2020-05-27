# Sitemap cheatsheet


## Sitemap formats

https://support.google.com/webmasters/answer/183668?hl=en

- XML
- RSS, mRSS, and Atom 1.0
- Text
- Google sites


See General sitemap guidelines secti

## Sitemaps protocol

https://www.sitemaps.org/protocol.html

### Fields

- `loc` - e.g.  `http://www.example.com/`, `http://www.example.com/catalog?item=12&amp;desc=vacation_hawaii`
- `lastmod` - e.g. `2020-03-04`
- `changefreq`  - e.g. `monthly`

Priority is dropped from the examples.

> Google does not currently consume the `<priority>` attribute in sitemaps. [source](https://support.google.com/webmasters/answer/183668?hl=en)

### Samples

```xml
<?xml version="1.0" encoding="UTF-8"?>

<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
   <url>
      <loc>http://www.example.com/</loc>

      <lastmod>2005-01-01</lastmod>

      <changefreq>monthly</changefreq>

      <priority>0.8</priority>
   </url>
</urlset> 
```


```xml
<?xml version="1.0" encoding="UTF-8"?>

<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">

   <url>

      <loc>http://www.example.com/</loc>

      <lastmod>2005-01-01</lastmod>

      <changefreq>monthly</changefreq>

      <priority>0.8</priority>

   </url>

   <url>

      <loc>http://www.example.com/catalog?item=12&amp;desc=vacation_hawaii</loc>

      <changefreq>weekly</changefreq>

   </url>

   <url>

      <loc>http://www.example.com/catalog?item=73&amp;desc=vacation_new_zealand</loc>

      <lastmod>2004-12-23</lastmod>

      <changefreq>weekly</changefreq>

   </url>

   <url>

      <loc>http://www.example.com/catalog?item=74&amp;desc=vacation_newfoundland</loc>

      <lastmod>2004-12-23T18:00:15+00:00</lastmod>

      <priority>0.3</priority>

   </url>

   <url>

      <loc>http://www.example.com/catalog?item=83&amp;desc=vacation_usa</loc>

      <lastmod>2004-11-23</lastmod>

   </url>

</urlset>
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbNjYwNjM1ODldfQ==
-->