require 'pathname'
require 'bundler/setup'

__LIB__ = Pathname.new(__FILE__).dirname.expand_path
$:.unshift(__LIB__.to_s) unless $:.include?(__LIB__.to_s)

require 'rspec_web/version'
require 'rspec_web/formatter'
require 'rspec_web/web_socket_server'
require 'rspec_web/web_application'