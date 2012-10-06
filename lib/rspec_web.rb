require 'pathname'

module RspecWeb
  LIB = Pathname.new(__FILE__).dirname.expand_path
  VERSION = LIB.join('..', 'VERSION').expand_path.read
end

$:.unshift(RspecWeb::LIB.to_s) unless $:.include?(RspecWeb::LIB.to_s)

# Pathname.new(__FILE__).dirname.join('rspec_web').expand_path.tap do |rspec_web_dir|
#   require rspec_web_dir.join('formatter').to_s
#   require rspec_web_dir.join('web_socket_server').to_s
#   require rspec_web_dir.join('web_application').to_s
# end
require 'rspec_web/formatter'
require 'rspec_web/web_socket_server'
require 'rspec_web/web_application'