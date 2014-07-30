require_relative '../test_helper'
require 'nokogiri'
require 'open-uri'
require './lib/models/data_scraper'


class DataScraperTest < Minitest::Test
  attr_reader :page, :filename, :raw_html, :data_scraper
  def setup
    @filename     = './lib/views/home_our_story.erb'
    @raw_html     = File.read(filename)
    @page         = Nokogiri::HTML(raw_html)
    @data_scraper = DataScraper.new(filename)
  end

  def test_it_gets_title
    results = data_scraper.get_text('title')
    assert_equal "Our Story - Backcountry Delicatessen", results
  end

  def test_it_gets_header
    results = data_scraper.get_text('header')
    assert_equal "Our Story", results
  end

  def test_it_get_the_main_body
    assert data_scraper.get_text('div.main_body').include?("Boniface")
  end

  def test_it_gets_image_text
    assert data_scraper.get_text('div.image').include?("originally")
  end

  def test_it_gets_community_header
    assert data_scraper.get_text('h2.community_header').include?("New Name")
  end

  def test_it_gets_community_body
    assert data_scraper.get_text('div.community_body').include?("adventurers")
  end

  def test_it_gets_community_body
    assert data_scraper.get_text('div.community_body').include?("adventurers")
  end

  def test_it_gets_another_image_text
    assert data_scraper.get_text('p.image').include?("The boys")
  end
end
