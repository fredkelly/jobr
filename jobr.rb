require 'sinatra/assetpack'

class Jobr < Sinatra::Base
  set :root, File.dirname(__FILE__)
  register Sinatra::AssetPack
  
  assets {
    serve '/css', from: 'assets/css'
    serve '/js', from: 'assets/js'
    serve '/images', from: 'assets/images'
    
    css :application, '/css/application.css', [
      '//fonts.googleapis.com/css?family=Source+Sans+Pro:400,600', # Google fonts
      '/css/reset.css',
      '/css/screen.css'
    ]
    js :application, '/js/application.js', [
      '//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js', # jQuery
      '/js/global.js'
    ]
    css_compression :sass
    #js_compression :coffee
  }
  
  get '/' do
    haml :index
  end
  
  get '/search' do
    haml :results
  end

end
