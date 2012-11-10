class Jobr < Sinatra::Base

    get '/' do
        haml :index
    end

    get '/search' do
        'in progress'
    end

end
