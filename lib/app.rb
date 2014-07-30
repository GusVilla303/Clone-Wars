require 'rack_session_access'
require_relative 'models/login'

class BackCountry < Sinatra::Base

  enable :sessions
  use RackSessionAccess if environment == :test
  set :session_secret, 'admin'

  helpers do
    def admin?
      session[:user] == "admin"
      #redirect '/login' unless session[:user]
    end
  end

  get '/' do
    erb :index
  end

  get '/admin' do
    erb :admin_index
  end

  post '/admin' do
    if params[:user] == "admin" && params[:password] == "admin"
      session[:user] = "admin"
    else
      session[:user] = ''
    end
    erb :admin_index
  end

  post '/admin_logout' do
    session[:user] = ''
    redirect '/admin'
  end

  get '/story' do
    erb :home_our_story
  end

  get '/admin_story' do
    if admin?
      erb :admin_our_story
    else
      redirect '/admin'
    end
  end

  get '/social' do
    erb :home_social_love
  end

  get '/admin_social' do
    if admin?
      erb :admin_social_love
    else
      redirect '/admin'
    end
  end

  get '/franchise_info' do
    erb :home_franchise_info
  end

  get '/admin_franchise_info' do
    if admin?
      erb :admin_franchise_info
    else
      redirect '/admin'
    end
  end

  get '/contact_us' do
    erb :home_contact_us
  end

  get '/admin_contact_us' do
    if admin?
      erb :admin_contact_us
    else
      redirect '/admin'
    end
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
