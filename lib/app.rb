class BackCountry < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/admin'do
    erb :admin_index
  end

  get '/story' do
    erb :home_our_story
  end

  get '/admin/story' do
    erb :admin_our_story
  end

  get '/social' do
    erb :home_social_love
  end

  get '/admin/social' do
    erb :admin_social_love
  end

  get '/franchise_info' do
    erb :home_franchise_info
  end

  get '/admin/franchise_info' do
    erb :admin_franchise_info
  end

  get '/contact_us' do
    erb :home_contact_us
  end

  get '/admin/contact_us' do
    erb :admin_contact_us
  end

  get '/menu/specialty_sandwiches' do
    erb :menu_specialty_sandwiches
  end

  get '/menu/hot_breakfast_sandwiches' do
    erb :menu_hot_breakfast_sandwiches
  end

  get '/menu/build_your_own_sandwiches' do
    erb :menu_build_your_own_sandwich
  end

  get '/menu/catering' do
    erb :menu_catering
  end

  get '/menu/other_food' do
    erb :menu_other_food
  end

  get '/admin/menu/:menu' do |type|
    menu_type = MenuStore.get_menu(type)
    erb :admin_menu, locals: {menu_type: menu_type}
  end

  get '/locations/:location' do |location|
    full_location = LocationStore.get_location(location)
    erb :location, locals: {location: full_location}
  end

  get '/admin/locations/:location' do |location|
    full_location = LocationStore.get_location(location)
    erb :admin_location, locals: {location: full_location}
  end

  get '/order_online/:location/' do |location|
    order_location = LocationStore.get_location(location)
    erb :order_online, locals: {location: order_location}
  end

  get '/admin/order_online/:location/' do |location|
    order_location = LocationStore.get_location(location)
    erb :admin_order_online, locals: {location: order_location}
  end
end
