require 'pathname'
require 'bundler/setup'

__LIB__ = Pathname.new(__FILE__).join('..', '..').expand_path
$:.unshift(__LIB__.to_s) unless $:.include?(__LIB__.to_s)

require 'rspec/web/version'
require 'rspec/web/formatter'
require 'rspec/web/version'