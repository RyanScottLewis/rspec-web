require 'bundler/setup'
require 'json'
require 'timeout'
require 'rspec/core/formatters/base_formatter'
require 'web_socket'

module RspecWeb
  class Formatter < RSpec::Core::Formatters::BaseFormatter
    def start(example_count)
      @timestamp = Time.now.to_i
      @socket = WebSocket.new("ws://localhost:10081")
      
      message = { receiver: "server", method: "identify", arguments: ["rspec"] }
      @socket.send(message.to_json)
      
      message = { receiver: "web", method: "startNewIteration", arguments: [@timestamp, example_count] }
      @socket.send(message.to_json)
    end
    
    def example_group_started(example_group); end
    def example_group_finished(example_group); end
    def example_started(example); end
    
    def example_passed(example)
      data = example_to_hash(example)
      message = { receiver: "web", method: "addToPassing", arguments: [@timestamp, data] }
      @socket.send(message.to_json)
    end
    
    def example_pending(example)
      data = example_to_hash(example)
      message = { receiver: "web", method: "addToPending", arguments: [@timestamp, data] }
      @socket.send(message.to_json)
    end
    
    def example_failed(example)
      data = example_to_hash(example)
      message = { receiver: "web", method: "addToFailing", arguments: [@timestamp, data] }
      @socket.send(message.to_json)
    end
    
    def start_dump; end
    def dump_failed(example); end
    def dump_summary(duration, example_count, failure_count, pending_count); end
    def message(message); end
    def dump_failures; end
    def dump_pending; end
    def format_backtrace(backtrace, example); end
    
    def close
      puts "Specs finished!.. "
      message = { receiver: "server", method: "disconnect", arguments: ["rspec"] }
      @socket.send(message.to_json)
      @socket.close
    end
    
    private
    
    def example_to_hash(example)
      {
        :started_at => example.metadata[:execution_result][:started_at].to_i,
        :finished_at => example.metadata[:execution_result][:finished_at].to_i,
        :run_time => example.metadata[:execution_result][:run_time],
        :file_path => example.metadata[:file_path],
        :line_number => example.metadata[:line_number],
        :description => example.metadata[:full_description]
      }
    end
  end
end