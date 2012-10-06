require 'pathname'
require 'bundler/setup'
require 'haml'
require 'sass'
require 'sinatra/base'

module RspecWeb
  class WebApplication < Sinatra::Base
    configure do
      set :haml, :format => :html5
      set :root, Pathname.new(__FILE__).dirname.join('web_application').expand_path.to_s
      
      enable :method_override
    end
    
    helpers do
      def partial(name)
        haml(:"partials/#{name}", :layout => false, :escape_attrs => false)
      end
    end
    
    get '/css/style.css' do
      scss :style
    end
    
    get '/' do
      haml :index
    end
  end
end