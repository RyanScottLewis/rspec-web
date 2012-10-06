Gem::Specification.new do |s|
  s.name = 'rspec-web'
  s.version = '0.1.11'
  s.author = 'Ryan Scott Lewis'
  s.homepage = 'http://github.com/c00lryguy/rspec-web'
  s.description = 'A web front-end for RSpec tests.'
  s.summary = 'Run and view Rspec tests from the browser.'
  s.email = 'ryan@rynet.us'
  
  s.require_path = 'lib'
  s.files = `git ls-files`.lines.collect { |line| line.strip }
  s.executables = Dir['bin/*'].find_all { |file| File.executable?(file) }.collect { |file| File.basename(file) }
  
  s.add_dependency('em-websocket', '~> 0.3')
  s.add_dependency('haml', '~> 3.1')
  s.add_dependency('sass', '~> 3.1')
  s.add_dependency('sinatra', '~> 1.3')
  s.add_dependency('rspec', '~> 2.0')
  s.add_dependency('web-socket-ruby', '~> 0.1')
  s.add_dependency('version', '~> 1.0')
end
