# Examples

```sh
$ gem help examples
```

<details>
<summary>Result</summary>
<pre>
Some examples of 'gem' usage.

* Install 'rake', either from local directory or remote server:

    gem install rake

* Install 'rake', only from remote server:

    gem install rake --remote

* Install 'rake', but only version 0.3.1, even if dependencies
  are not met, and into a user-specific directory:

    gem install rake --version 0.3.1 --force --user-install

* List local gems whose name begins with 'D':

    gem list D

* List local and remote gems whose name contains 'log':

    gem search log --both

* List only remote gems whose name contains 'log':

    gem search log --remote

* Uninstall 'rake':

    gem uninstall rake

* Create a gem:

    See https://guides.rubygems.org/make-your-own-gem/

* See information about RubyGems:

    gem environment

* Update all gems on your system:

    gem update

* Update your local version of RubyGems

    gem update --system

</pre>

</details>
