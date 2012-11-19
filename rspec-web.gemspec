# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rspec-web"
  s.version = nil

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Scott Lewis"]
  s.date = "2012-11-19"
  s.description = "A web front-end for RSpec tests."
  s.email = "ryan@rynet.us"
  s.executables = ["rspec-web"]
  s.files = [".gitignore", ".rvmrc", "Gemfile", "LICENSE", "README.md", "Rakefile", "VERSION", "bin/rspec-web", "lib/rspec_web.rb", "lib/rspec_web/formatter.rb", "lib/rspec_web/version.rb", "lib/rspec_web/web_application.rb", "lib/rspec_web/web_application/assets/css/bootstrap.bottombar.css", "lib/rspec_web/web_application/assets/css/bootstrap.css", "lib/rspec_web/web_application/assets/css/bootstrap.responsive.css", "lib/rspec_web/web_application/assets/img/bootstrap.png", "lib/rspec_web/web_application/assets/img/glyphicons-halflings-white.png", "lib/rspec_web/web_application/assets/img/glyphicons-halflings.png", "lib/rspec_web/web_application/assets/img/rails.png", "lib/rspec_web/web_application/assets/img/traffic.png", "lib/rspec_web/web_application/assets/js/application.js.coffee", "lib/rspec_web/web_application/assets/js/lib/backbone.js", "lib/rspec_web/web_application/assets/js/lib/bootstrap.js", "lib/rspec_web/web_application/assets/js/lib/date.js", "lib/rspec_web/web_application/assets/js/lib/jquery.cookie.js", "lib/rspec_web/web_application/assets/js/lib/jquery.gracefulWebSocket.js", "lib/rspec_web/web_application/assets/js/lib/jquery.js", "lib/rspec_web/web_application/assets/js/lib/jquery.json.js", "lib/rspec_web/web_application/assets/js/lib/underscore.js", "lib/rspec_web/web_application/assets/js/models/example.js", "lib/rspec_web/web_application/assets/js/models/exampleCollection.js", "lib/rspec_web/web_application/assets/js/models/iteration.js", "lib/rspec_web/web_application/assets/js/models/iterationCollection.js", "lib/rspec_web/web_application/assets/js/models/project.js", "lib/rspec_web/web_application/assets/js/models/viewContainer.js", "lib/rspec_web/web_application/assets/js/models/webSocketContainer.js", "lib/rspec_web/web_application/assets/js/rspecWebFrontend.js", "lib/rspec_web/web_application/assets/js/script.js", "lib/rspec_web/web_application/views/index.haml", "lib/rspec_web/web_application/views/partials/example_entry.haml", "lib/rspec_web/web_application/views/partials/iteration_entry.haml", "lib/rspec_web/web_application/views/partials/iteration_list_entry.haml", "lib/rspec_web/web_application/views/style.scss", "lib/rspec_web/web_socket_server.rb", "rspec-web.gemspec"]
  s.homepage = "http://github.com/c00lryguy/rspec-web"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Run and view Rspec tests from the browser."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<em-websocket>, ["~> 0.3"])
      s.add_runtime_dependency(%q<haml>, ["~> 3.1"])
      s.add_runtime_dependency(%q<sass>, ["~> 3.1"])
      s.add_runtime_dependency(%q<sinatra>, ["~> 1.3"])
      s.add_runtime_dependency(%q<rspec>, ["~> 2.0"])
      s.add_runtime_dependency(%q<web-socket-ruby>, ["~> 0.1"])
      s.add_runtime_dependency(%q<version>, ["~> 1.0"])
      s.add_runtime_dependency(%q<sprockets>, ["~> 2.0"])
      s.add_runtime_dependency(%q<uglifier>, ["~> 1.0"])
      s.add_runtime_dependency(%q<coffee-script>, ["~> 2.2"])
    else
      s.add_dependency(%q<em-websocket>, ["~> 0.3"])
      s.add_dependency(%q<haml>, ["~> 3.1"])
      s.add_dependency(%q<sass>, ["~> 3.1"])
      s.add_dependency(%q<sinatra>, ["~> 1.3"])
      s.add_dependency(%q<rspec>, ["~> 2.0"])
      s.add_dependency(%q<web-socket-ruby>, ["~> 0.1"])
      s.add_dependency(%q<version>, ["~> 1.0"])
      s.add_dependency(%q<sprockets>, ["~> 2.0"])
      s.add_dependency(%q<uglifier>, ["~> 1.0"])
      s.add_dependency(%q<coffee-script>, ["~> 2.2"])
    end
  else
    s.add_dependency(%q<em-websocket>, ["~> 0.3"])
    s.add_dependency(%q<haml>, ["~> 3.1"])
    s.add_dependency(%q<sass>, ["~> 3.1"])
    s.add_dependency(%q<sinatra>, ["~> 1.3"])
    s.add_dependency(%q<rspec>, ["~> 2.0"])
    s.add_dependency(%q<web-socket-ruby>, ["~> 0.1"])
    s.add_dependency(%q<version>, ["~> 1.0"])
    s.add_dependency(%q<sprockets>, ["~> 2.0"])
    s.add_dependency(%q<uglifier>, ["~> 1.0"])
    s.add_dependency(%q<coffee-script>, ["~> 2.2"])
  end
end
