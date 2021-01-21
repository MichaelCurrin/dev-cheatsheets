# Analytics


## Standard

Adding Google Analytics to your site.

- `snippet.html`
    ```html
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-123467-78"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'UA-123467-78');

    </script>
    ```


## Alternate

Here is a variation from [HTML5 boilerplate](https://github.com/h5bp/html5-boilerplate/blob/master/dist/index.html) which might be the old style which uses GA directly rather than GTM as above.

- `snippet.html
    ```html
    <script>
        window.ga = function () { ga.q.push(arguments) };
        ga.q = [];
        ga.l = +new Date;
        ga('create', 'UA-123467-78', 'auto');
        ga('set', 'anonymizeIp', true);
        ga('set', 'transport', 'beacon');
        ga('send', 'pageview');
    </script>
    <script src="https://www.google-analytics.com/analytics.js" async></script>
    ```


## Jekyll

For approaches to adding analytics to a Jekyll site, see the [Jekyll Analytics][] section of this site.

[Jekyll Analytics]: {{ site.baseurl }}{% link cheatsheets/jekyll/templating/analytics.md %}
