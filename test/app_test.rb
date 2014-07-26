require_relative 'test_helper'
require 'nokogiri'

class BackCountryTest < Minitest::Test
  include Rack::Test::Methods

  def app
    BackCountry.new
  end

  def test_homepage
    get '/'
    html = Nokogiri::HTML(last_response.body)

    assert last_response.ok?
    assert_equal "Home - Backcountry Delicatessen", html.css('title').text
    assert_equal "Our Story", html.css('li#menu-item-21').text
    assert_equal "Denver, CO", html.css('li#menu-item-24').text
  end

  def test_our_story
    get '/story'
    html = Nokogiri::HTML(last_response.body)

    assert last_response.ok?
    assert_equal "Our Story", html.css('h1').text
    assert html.css('section').text.include?('Backcountry Deli')
    assert html.css('div.clearfix').text.include?('Old Town')
  end
end
