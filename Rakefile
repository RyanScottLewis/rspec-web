require 'pathname'

def require_task(path)
  begin
    require path
    
    yield
  rescue LoadError
    puts '', "Could not load '#{path}'.", 'Try to `rake gem:spec` and `bundle install` and try again.', ''
  end
end

spec = Gem::Specification.new do |s|
  s.name = 'rspec-web'
  s.author = 'Ryan Scott Lewis'
  s.homepage = "http://github.com/c00lryguy/#{s.name}"
  s.description = 'A web front-end for RSpec tests.'
  s.summary = 'Run and view Rspec tests from the browser.'
  s.email = 'ryan@rynet.us'
  
  s.require_path = 'lib'
  s.files = `git ls-files`.lines.collect { |line| line.strip }
  s.executables = Dir['bin/*'].find_all { |file| File.executable?(file) }.collect { |file| File.basename(file) }
  
  s.add_dependency 'em-websocket', '~> 0.3'
  s.add_dependency 'haml', '~> 3.1'
  s.add_dependency 'sass', '~> 3.1'
  s.add_dependency 'sinatra', '~> 1.3'
  s.add_dependency 'rspec', '~> 2.0'
  s.add_dependency 'web-socket-ruby', '~> 0.1'
  s.add_dependency 'version', '~> 1.0'
  s.add_dependency 'sprockets', '~> 2.0'
  s.add_dependency 'uglifier', '~> 1.0'
  s.add_dependency 'coffee-script', '~> 2.2'
end

require_task 'rake/version_task' do
  Rake::VersionTask.new do |t|
    t.with_git_tag = true
    t.with_gemspec = spec
  end
end

require_task 'yard' do
  require 'yard/rake/yardoc_task'
  YARD::Rake::YardocTask.new
end

namespace :gem do
  desc 'Generate the gemspec defined in this Rakefile'
  task :spec do
    Pathname.new("#{spec.name}.gemspec").open('w') { |f| f.write(spec.to_ruby) }
  end
end

desc 'Install the Bundle, generating the gemspec first'
task bundle: 'gem:spec' do
  puts `bundle install`
end

require 'rubygems/package_task'
Gem::PackageTask.new(spec) do |t|
  t.need_zip = false
  t.need_tar = false
end

task :default do
  puts `rake -T`
end