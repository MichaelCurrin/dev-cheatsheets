# Windows compatibility

If you use Windows or you want developers on Windows to use your project, add this to your `Gemfile`.

From the file created by `jekyll new` for Jekyll `4.1`.

- `Gemfile`
    ```ruby
    # Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
    # and associated library.
    platforms :mingw, :x64_mingw, :mswin, :jruby do
      gem "tzinfo", "~> 1.2"
      gem "tzinfo-data"
    end

    # Performance-booster for watching directories on Windows
    gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]
    ```
