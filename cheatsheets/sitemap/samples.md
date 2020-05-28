# Samples

From Google help:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"> 
  <url>
    <loc>http://www.example.com/foo.html</loc>
    <lastmod>2018-06-04</lastmod>
  </url>
</urlset>
```

From sitemaps.org:

```xml
<?xml version="1.0" encoding="UTF-8"?>

<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
   <url>
      <loc>http://www.example.com/</loc>

      <lastmod>2005-01-01</lastmod>

      <changefreq>monthly</changefreq>
   </url>
</urlset> 
```

Longer example:

```xml
<?xml version="1.0" encoding="UTF-8"?>

<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">

   <url>

      <loc>http://www.example.com/</loc>

      <lastmod>2005-01-01</lastmod>

      <changefreq>monthly</changefreq>
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

   </url>

   <url>

      <loc>http://www.example.com/catalog?item=83&amp;desc=vacation_usa</loc>

      <lastmod>2004-11-23</lastmod>

   </url>

</urlset>
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEzMzUzMDIzNjldfQ==
-->