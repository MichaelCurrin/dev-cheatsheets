# GitHub Pages

## Gems on GH Pages
> Environment for standard GH Pages set up (without GH Actions)

See the [Dependency versions](https://pages.github.com/versions/) page for what gems GH Pages uses for builds.

You can enable these using `plugins` field of your config.

But GH Pages will ignore your `Gemfile` so you can't add other gems or to change a version.


## Jekyll versions

- `3.8.5`
    - Up to the end of 2020, this was used on GH Pages. There is a ticket open on the Jekyll repo around upgrade to Jekyll 4 but that is a long way off.
- `3.9.0`
    - At the end of 2020, GH Pages upgrade Jekyll to `3.9` to fix a security issue. That can also be fixed an automated security PR which does the following in your `Gemfile.lock`:
        ```diff
        - kramdown (2.2.1)
        + kramdown (2.3.0)
        ```
    - It also means that the [kramdown-parser-gfm][] gem has to be installed explicitly for local builds. So add it to your `Gemfile` file. It will install `kramdown`. See on [Kramdown V2][] in in Jekyll 3 to 4 docs.
    - Sample
        ```ruby
        gem 'jekyll', '~> 3.9'
        gem 'kramdown-parser-gfm', '~> 1.1.0'
        ```
- `4.X`
    - Jekyll 4 is available through GH Actions and Netlify, if you configure your build and choose your Jekyll version. See [Jekyll 3 to 4][] in the docs.
    - Note that [kramdown-parser-gfm][] is already included in the lockfile for a build of Jekyll `4.1` at least so you don't have to add this to your `Gemfile`. The Kramdown version is also _already_ higher, so the vulnerability from above is not relevant.
    - Sample
        ```ruby
        gem 'jekyll', '~> 4.1'
        ```

[kramdown-parser-gfm]: https://github.com/kramdown/parser-gfm
[Jekyll 3 to 4]: https://jekyllrb.com/docs/upgrading/3-to-4
[Kramdown V2]: https://jekyllrb.com/docs/upgrading/3-to-4/#kramdown-v2


## Resources

- [GitHub Pages](https://pages.github.com/) home
- [Getting started](https://guides.github.com/features/pages/) guide on GitHub
