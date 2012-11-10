require 'sinatra/assetpack'

class Jobr < Sinatra::Base
  set :root, File.dirname(__FILE__)
  register Sinatra::AssetPack
  
  assets {
    serve '/css', from: 'assets/css'
    serve '/images', from: 'assets/images'
    
    css :application, '/css/application.css', [
      '/css/reset.css',
      '/css/screen.css'
    ]
    css_compression :sass
  }
  
  get '/' do
    haml :index
  end
  
  get '/search' do
    'in progress'
  end

end
