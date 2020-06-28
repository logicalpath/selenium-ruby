# qa_selenium

Repository of ruby selenium scripts

Running the project:

- clone the project `git clone git@github.com:logicalpath/selenium-ruby.git`
- cd to root directory of project (for example qa_selenium)
- run `bundle install`
- run `rbenv rehash` (this adds rspec to .rbenv/shims)
- download the web drivers ([Firefox][geckodriver], [Chrome][chromedriver]) and put them in the `bin` directory of this repository

Environment Variables that can be set at runtime:

```ruby
ENV['BROWSER_MODE'] ||= 'headless'
ENV['BASE_URL'] ||= 'http://localhost:9292'
ENV['BROWSER']  ||= 'chrome'
ENV['OPSYS'] ||= 'undefined'
ENV['SCREENSHOTS'] ||= 'yes'
ENV['WDRIVER_PATH'] ||= './bin/chromedriver'
```

Set `ENV['WDRIVER_PATH']` to the path of the webdriver binary.
`ENV['BROWSER']` will determine which driver to append to the `WDRIVER_PATH`:

e.g.

```
$ WDRIVER_PATH="./bin/chromedriver" BROWSER="chrome" bundle exec rspec -r ./config/local.rb
```

I would recommend putting your selenium drivers in the empty `bin` directory of this repository so it's easy to access.

## Linter

This repo uses [Rubocop][robocop] as the linter. It can be customized with the `.rubocop.yml` file.

Run

```
$ bundle exec rubocop .
```

from the project root to lint the whole code base.

For some minor or simple changes, like indentation and spacing, you can run

```
$ bundle exec rubocop . --auto-correct
```

to have rubocop update the syntax for you.

[rubocop]: https://github.com/bbatsov/rubocop
[geckodriver]: https://github.com/mozilla/geckodriver/releases
[chromedriver]: http://chromedriver.chromium.org/downloads
