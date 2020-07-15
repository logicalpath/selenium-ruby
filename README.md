# Selenium Ruby

These scripts run against a local install of Dave Haeffner's [the-internet](https://github.com/saucelabs/the-internet). I highly reccomend his [Guidebook](https://seleniumguidebook.com/) especially if you are just learning Selenium.

## Installing the project:

- clone the project `git clone git@github.com:logicalpath/selenium-ruby.git`
- cd to root directory of project (for example qa_selenium)
- run `bundle install`
- run `rbenv rehash` (this adds rspec to .rbenv/shims)
- download the web drivers ([Firefox][geckodriver], [Chrome][chromedriver]) and put them in the `\usr\bin` directory.

Environment Variables that can be set at runtime:

```ruby
ENV['BROWSER_MODE'] ||= 'headless'
ENV['BASE_URL'] ||= 'http://localhost:9292'
ENV['BROWSER']  ||= 'chrome'
ENV['OPSYS'] ||= 'undefined'
ENV['SCREENSHOTS'] ||= 'yes'
ENV['WDRIVER_PATH'] ||= '<path if different from \usr\bin>'
```

`ENV['BROWSER']` will determine which driver to append to the `WDRIVER_PATH`.

## Executing the scripts

From the command line, run `rspec`:

```
$ bundle exec rspec -r ./config/local.rb
```

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
