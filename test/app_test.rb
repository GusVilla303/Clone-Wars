require_relative 'test_helper'
require 'nokogiri'

class BackCountryTest < Minitest::Test
  include Rack::Test::Methods

  def app
    BackCountry.new
  end

  def html
    html = Nokogiri::HTML(last_response.body)
  end

  def test_homepage
    get '/'

    assert last_response.ok?
    assert_equal "Home - Backcountry Delicatessen", html.css('title').text
    assert_equal "Our Story", html.css('li#menu-item-21').text
    assert_equal "Denver, CO", html.css('li#menu-item-24').text
  end

  def test_our_story
    get '/story'

    assert last_response.ok?
    assert_equal "Our Story", html.css('h1').text
    assert html.css('section').text.include?('Backcountry Deli')
    assert html.css('div.clearfix').text.include?('Old Town')
  end

  def test_social_love
    get '/social'

    assert last_response.ok?
    assert_equal "Social Love - Backcountry Delicatessen", html.css('title').text
  end

  def test_franchise_info
    get '/franchise_info'

    assert last_response.ok?
    assert_equal "Franchise Info - Backcountry Delicatessen", html.css('title').text
  end

  def test_contact_us
    get '/contact_us'

    assert last_response.ok?
    assert_equal "Contact Us - Backcountry Delicatessen", html.css('title').text
  end

  def test_menu_hot_breakfast_sandwiches
    get '/hot_breakfast_sandwiches'

    assert last_response.ok?
    assert html.css('body').text.include?("Egg, Sausage and Cheddar")
  end

  def test_menu_specialty_sandwiches
    get '/specialty_sandwiches'

    assert last_response.ok?
    # assert html.css('body').text.include?("Egg, Sausage and Cheddar")
  end
end
