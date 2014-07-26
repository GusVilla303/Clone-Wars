class BackCountry < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/story' do
    erb :our_story
  end

  get '/social' do
    erb :social_love
  end

  get '/menu/:menu' do |type|
    erb :menu, locals: {menu_type: menu_type}
  end


  get 'locations/:location' do |location|
    erb :location, locals: {location: full_location}
  end

  get 'order_online/:location/' do |location|
    erb :order_online, locals: {location: order_location}
  end
end
