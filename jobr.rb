class Jobr < Sinatra::Base

  get '/' do
    haml :index
  end
end
