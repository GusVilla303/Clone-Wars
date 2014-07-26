class BackCountry < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/story' do
    erb :our_story
  end

end
