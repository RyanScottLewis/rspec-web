# rspec-web

A web front-end for RSpec tests.

## Install

### Bundler

Add the following to your `Gemfile`:

```ruby
group :development do
  gem 'rspec-web'
end
```

then run `bundle install`.

### RubyGems

`gem install rspec-web`

## Usage

### Basic Usage

1. Start up a `rspec-web` server (which actually consists of two servers; an HTTP server and a Web Socket server)
2. Open web browser with URL `http://localhost:4567/`
3. Run your specs with the formatter by using `rspec spec -f RspecWeb::Formatter`

### Guard Usage

If you use [`guard-rspec`](https://github.com/guard/guard-rspec), you should checkout [`guard-rspec-web`](https://github.com/c00lryguy/guard-rspec-web) for [`guard`](https://github.com/guard/guard) integration

## License

RspecWeb is released under the MIT license:

www.opensource.org/licenses/MIT

See [`LICENSE`](https://github.com/c00lryguy/rspec-web/blob/master/LICENSE) for more details.