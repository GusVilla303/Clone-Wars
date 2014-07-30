require_relative '../test_helper'
require 'nokogiri'
require 'open-uri'
require './lib/models/data_scraper'


class DataScraperTest < Minitest::Test
  attr_reader :page, :filename, :raw_html, :data_scraper
  def setup
    @filename = './lib/views/home_our_story.erb'
    @raw_html = File.read(filename)
    @page = Nokogiri::HTML(raw_html)
    @data_scraper = DataScraper.new(filename)
  end

  def test_it_gets_title
    assert_equal "Our Story - Backcountry Delicatessen", data_scraper.title
  end

  def test_it_gets_header
    assert_equal "Our Story", data_scraper.header
  end

  def test_it_gets_new_name
    assert data_scraper.h2.include?("New Name")
  end

  def test_it_get_the_body
    assert_equal data_scraper.body.include?("Boniface")
  end

end
