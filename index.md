---
title: Home
layout: home
---

There are a lot of tools and languages in here - I hope you find what you are looking for or discovering something
useful.

## Featured topics

### Scripting

<div class="flex-container">
    <a href="{% link cheatsheets/python/index.md %}">
        <div>
           Python
        </div>
    </a>

    <a href="{% link cheatsheets/javascript/index.md %}">
        <div>
           JavaScript
        </div>
    </a>
</div>

### Static sites and docs

<div class="flex-container">

    <a href="{% link cheatsheets/markdown/index.md %}">
        <div>
           Markdown
        </div>
    </a>

    <a href="{% link cheatsheets/jekyll/index.md %}">
        <div>
           Jekyll
        </div>
    </a>
</div>

### Command-line

<div class="flex-container">
    <a href="{% link cheatsheets/git/index.md %}">
        <div>
           Git
        </div>
    </a>

    <a href="{% link cheatsheets/shell/index.md %}">
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
