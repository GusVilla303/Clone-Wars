require 'other/login'
require 'other/location_store'

class BackCountry < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/admin' do
    erb :admin_index
  end

  post '/admin' do
    Login.set_info(params)
    redirect '/admin'
  end

  post '/admin_logout' do
    Login.reset
    redirect '/admin'
  end

  get '/story' do
    erb :home_our_story
  end

  get '/admin_story' do
    erb :admin_our_story
  end

  get '/social' do
    erb :home_social_love
  end

  get '/admin_social' do
    erb :admin_social_love
  end

  get '/franchise_info' do
    erb :home_franchise_info
  end

  get '/admin_franchise_info' do
    erb :admin_franchise_info
  end

  get '/contact_us' do
    erb :home_contact_us
  end

  get '/admin_contact_us' do
    erb :admin_contact_us
  end

  get '/specialty_sandwiches' do
    erb :menu_specialty_sandwiches
  end

  get '/hot_breakfast_sandwiches' do
    erb :menu_hot_breakfast_sandwiches
  end

  get '/build_your_own_sandwiches' do
    erb :menu_build_your_own_sandwich
  end

  get '/catering' do
    erb :menu_catering
  end

  get '/other_food' do
    erb :menu_other_food
  end

  get '/admin/:menu/' do |type|
    # menu_type = MenuStore.get_menu(type)
    erb :admin_menu #, locals: {menu_type: menu_type}
  end

  get '/denver' do
    erb :location_denver
  end

  get '/fort_collins' do
    erb :location_fort_collins
  end

  get '/jackson_hole' do
    erb :location_jackson_hole
  end

  get '/steamboat_springs' do
    erb :location_steamboat_springs
  end

  get '/admin/denver' do
    # full_location = LocationStore.get_location(location)
    erb :admin_location #, locals: {location: full_location}
  end

  get '/admin_locations/:location' do |location|
    # full_location = LocationStore.get_location(location)
    erb :admin_location #, locals: {location: full_location}
  end

  get '/order_online_denver' do
    erb :order_online_denver
  end

  get '/order_online_fort_collins' do
    erb :order_online_fort_collins
  end

  get '/order_online_jackson_hole' do
    erb :order_online_jackson_hole
  end

  get '/order_online_steamboat_springs' do
    erb :order_online_steamboat_springs
  end
end
