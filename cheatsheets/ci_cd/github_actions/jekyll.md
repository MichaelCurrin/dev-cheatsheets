# Jekyll Github Actions


## Resources

- [Github Actions CI](https://jekyllrb.com/docs/continuous-integration/github-actions/) - a tutorial I wrote for the Jekyll docs.
- [jekyll-actions-quickstart](https://michaelcurrin.github.io/jekyll-actions-quickstart/) project site of mine including resources


## Actions

I haven't tried all these out and there are a lot more in the marketplace.


- [Jekyll 4 Build Deploy](https://github.com/marketplace/actions/jekyll-4-build-deploy)
- [Jekyll Actions](https://github.com/marketplace/actions/jekyll-actions) action
- [Jekyll Deploy GH Pages](https://github.com/marketplace/actions/jekyll-deploy-gh-pages)

## Local config

If you need to set values in the environment locally, you could do this with an ignored `.env` file at the root. You’ll have to to load that into the shell. Some plugins will read from a `.env` file though. 

In this case the only environment variable needed is one needed to actually run the action and build to gh-pages branch, so this project has no .env file.
