require 'bundler/setup'
require 'json'
require 'em-websocket'

module RspecWeb
  module WebSocketServer
    class << self
      def run
        EventMachine.run do
          @receivers = {}
          
          EventMachine::WebSocket.start(host: '0.0.0.0', port: 10081) do |ws|
            ws.onmessage do |raw_msg|
              msg = JSON.parse(raw_msg)
              
              if msg.has_key?("receiver")
                receiver = msg["receiver"]
                case receiver
                when "server"
                  if msg.has_key?("method")
                    case msg["method"]
                    when "identify"
                      identity = msg["arguments"].first
                      @receivers[identity] ||= []
                      @receivers[identity] << ws
                    when "disconnect"
                      identity = msg["arguments"].first
                      @receivers[identity] ||= []
                      @receivers[identity].delete(ws)
                    when "runSpecs"
                      command = msg["arguments"].first
                      
                      Thread.new { `#{command}` }
                    end
                  end
                when "web" || "rspec"  
                  @receivers[receiver] ||= []
                  @receivers[receiver].each { |socket| socket.send(raw_msg) }
                end
              end
            end
            
            # ws.onclose {}
          end
        end
      end
      
      def run!
        Thread.new { run }
      end
    end
  end
end
