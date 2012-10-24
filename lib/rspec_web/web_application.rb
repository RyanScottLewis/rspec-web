require 'pathname'
require 'bundler/setup'
require 'haml'
require 'sass'
require 'sinatra/base'
require 'coffee-script'
require 'uglifier'
require 'sprockets'

module RspecWeb
  
  class WebApplication < Sinatra::Base
    module AssetHelpers
      def asset_path(source)
        "/assets/" + settings.sprockets.find_asset(source).digest_path
      end
    end
    
    configure do
      set :haml, :format => :html5
      set :root, Pathname.new(__FILE__).dirname.join('web_application').expand_path.to_s
      
      set :root, File.expand_path('../', __FILE__)
      set :sprockets, Sprockets::Environment.new(root)
      set :precompile, [ /\w+\.(?!js|css).+/, /application.(css|js)$/ ]
      # set :precompile, [ /.*/ ]
      set :assets_prefix, 'assets'
      set :assets_path, File.join(root, 'public', assets_prefix)
      
      sprockets.append_path(File.join(root, 'assets', 'stylesheets'))
      sprockets.append_path(File.join(root, 'assets', 'javascripts'))
      sprockets.append_path(File.join(root, 'assets', 'images'))
      
      sprockets.context_class.instance_eval do
        include AssetHelpers
      end
      
      enable :method_override
    end
    
    helpers do
      include AssetHelpers
      
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