---
title: Home
layout: home
---

> A collection of code snippets and CLI notes for easy reference

There are a lot of tools and languages on this site here for my own reference and I hope you find something useful here too, by looking for something specific or just discovering what is here.


## All cheatsheets

[Cheatsheets]({{ site.baseurl }}{% link cheatsheets/index.md %}) page


## Featured topics

### Scripting

<div class="flex-container">
    <a href="{{ site.baseurl }}{% link cheatsheets/python/index.md %}">
        <div>
           Python
        </div>
    </a>
    <a href="{{ site.baseurl }}{% link cheatsheets/javascript/index.md %}">
        <div>
           JavaScript
        </div>
    </a>
</div>

### Static sites and docs

<div class="flex-container">
    <a href="{{ site.baseurl }}{% link cheatsheets/markdown/index.md %}">
        <div>
           Markdown
        </div>
    </a>
    <a href="{{ site.baseurl }}{% link cheatsheets/jekyll/index.md %}">
        <div>
           Jekyll
        </div>
    </a>

</div>

### Command-line

<div class="flex-container">
    <a href="{{ site.baseurl }}{% link cheatsheets/git/index.md %}">
        <div>
           Git
        </div>
    </a>
    <a href="{{ site.baseurl }}{% link cheatsheets/shell/index.md %}">
        <div>
           Shell
        </div>
    </a>

</div>

<style>
    .flex-container {
        display: flex;
        flex-wrap: wrap;
        padding-bottom: 1em;
    }

    .flex-container>a>div {
        margin: 10px;
        padding: 20px;
        font-size: 20px;

        box-shadow: 1px 2px 4px gray;
    }

</style>
