# rspec-web

A web front-end for `RSpec` 2 tests.

*Insert sexy screenshots here...*

This consists of three main components: `RSpec::Web::Formatter`, `RSpec::Web::Application`, and `RSpec::Web::SocketServer`.

The `Formatter` is used by `RSpec` to send messages to the `SocketServer`, which displays to all users of the `Application`.

    Dev1 Workstation ➙ Formatter ➙              ➙ Application ➙ Dev1 Workstation
    Dev2 Workstation ➙ Formatter ➙ SocketServer ➙ Application ➙ Dev2 iPad
    Dev3 Workstation ➙ Formatter ➙              ➙ Application ➙ Dev3 Android

## Install

> Note:  If you use [`guard`](https://github.com/guard/guard), you should checkout [`guard-rspec-web`](https://github.com/c00lryguy/guard-rspec-web) for [`guard-rspec`](https://github.com/guard/guard-rspec) integration.

### Bundler

Add the following to your `Gemfile`:

```ruby
group :development do
  gem 'rspec-web'
end
```

then run `bundle install`.

### RubyGems

```sh
$ gem install rspec-web
```

## Usage

### Single Developer

1. Run the `rspec-web` command which will start of two servers; an HTTP server and a Web Socket server.
2. Open web browser with URL `http://localhost:4567/`
3. Run your specs with the formatter by using `rspec spec -f RSpec::Web::Formatter`

### Multi-Developer

The `Rspec::Web::SocketServer` needs to be run on a computer accessible on your network by all workstations
which will be running tests.

The `Rspec::Web::Application` needs to be run on a computer accessible on your network by all devices
which will be viewing the application.

On host 192.168.1.10 (for example; your server):

1. Run the `rspec-web` command which will start of two servers; an HTTP server and a Web Socket server.

On host 192.168.1.25 (for example; a developer's workstation):

1. Add or edit your `Gemfile` with the following (developers do not need the HTTP/Web Socket server):

    ```ruby
    group :development do
      gem 'rspec-web', require: 'rspec/web/formatter'
    end
    ```

2. Add or edit your `spec_helper.rb` with the following:

    ```ruby
    RSpec.configure do |c|
      c.web.host = '192.168.1.10'
    end
    ```

3. Open web browser with URL `http://192.168.1.10:4567/`
4. Run your specs with the formatter by using `rspec spec -f RSpec::Web::Formatter`

### Internet-Enabled

Start like you would deploy any [Rack](http://rack.github.com) application. I suggest [Unicorn](http://unicorn.bogomips.org) with [Nginx](http://nginx.org) ([Guide](http://recipes.sinatrarb.com/p/deployment/nginx_proxied_to_unicorn)).

Setup your `config.ru`:

    require 'rspec/web/application'
    
    run RSpec::Web::Application

You need to setup your HTTP server to make the Web Applications assets (images, scripts, etc) accessible to the Internet.

Get the path of your `rspec-web` gem:

    $ gem which rspec-web

This will return something like `.../ruby/gems/rspec-web-X.X.X/lib/rspec_web.rb`.  
That that path without the filename (i.e.: `.../ruby/gems/rspec-web-X.X.X/lib`) and add `/rspec_web/web_application/public`,
resulting in something like `.../ruby/gems/rspec-web-X.X.X/lib/rspec_web/web_application/public`.  
This is the path to add to your HTTP server's configuration.

You also need to make sure that the Web Socket server is always running.  
You can run only the Web Socket server by passing the `--socket-server` option to `rspec-web`.

### Launch Within Ruby

You may also run the Application or Socket Server from your own Ruby scripts:

    require 'rspec/web/application'
    
    RSpec::Web::Application.run # Use #run! to run in a new Thread

or

    require 'rspec/web/socket_server'
    
    RSpec::Web::SocketServer.run # Use #run! to run in a new Thread

### Create Your Own Front-End

You can easily implement your own web front-end by making your own `RSpec::Web::Application`.

## Configure

### Formatter

`rspec-web` adds the following `RSpec` configuration settings which can be set within your `spec_helper.rb`.

Example:

    RSpec.configure do |c|
      # ...
    end

> Note:  Values defined further down the block will override previous values.

<div style='width: 250px; float: left;'>**`web.format` (default: `json`)**</div>    The format of the messages to send to the `RSpec::Web::SocketServer`
<div style='width: 250px; float: left;'>**`web.host` (default: `localhost`)**</div> This will set `web.application.host` and `web.socket_server.host` to the given value.  
<div style='width: 250px; float: left;'>**`web.port` (default: `4567`)**</div>      This will set `web.application.port` and `web.socket_server.port` to the given value.  
<div style='width: 250px; float: left;'>**`web.uri`**</div>                         This will set `web.host` and `web.port` to the host and port specified in the given URI.  
<div style='width: 250px; float: left;'>**`web.application.host`**</div>            The host the `RSpec::Web::Application` is running on.  
<div style='width: 250px; float: left;'>**`web.application.port`**</div>            The port the `RSpec::Web::Application` is running on.  
<div style='width: 250px; float: left;'>**`web.application.uri`**</div>             This will set `web.application.host` and `web.application.port` to the host and port specified in the given URI.  
<div style='width: 250px; float: left;'>**`web.socket_server.host`**</div>          The host the `RSpec::Web::SocketServer` is running on.  
<div style='width: 250px; float: left;'>**`web.socket_server.port`**</div>          The port the `RSpec::Web::SocketServer` is running on.  
<div style='width: 250px; float: left;'>**`web.socket_server.uri`**</div>           This will set `web.socket_server.host` and `web.socket_server.port` to the host and port specified in the given URI.

### Application

TODO: Can set port the server is running on, theme, etc..

### SocketServer

TODO: Can set port the server is running on, the format of the messages being received/sent, etc..

### 

## TODO

  * DataBase

        Dev1 Workstation ➙ Formatter ➙              ➙ Application ➙ Dev1 Workstation
        Dev2 Workstation ➙ Formatter ➙ SocketServer ➙ Application ➙ Dev2 iPad
        Dev3 Workstation ➙ Formatter ➙    ➘    ➚    ➙ Application ➙ Dev3 Android
                                         Database

  * Authentication
  
  The SocketClient must give the SocketServer credentials on connect.
  
  * Authorization
  
  The SocketServer must only send messages from projects that the current user is authorized for.
  
  * Add multiple `RSpec::Web::SocketServer` to watch for events.

## License

`rspec-web` is released under the [MIT license](http://www.opensource.org/licenses/MIT).  
See [`LICENSE`](https://github.com/c00lryguy/rspec-web/blob/master/LICENSE) for more details.