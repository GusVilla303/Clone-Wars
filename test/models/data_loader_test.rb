require 'test_helper'
require 'nokogiri'

class DataLoaderTest < Minitest::Test
  attr_reader :filename, :data_scraper

  def setup
    @filename = './lib/views/home_our_story.erb'
    @data_scraper = DataScraper.new(filename)
  end

  def test_test_it_gets_data_from_scraper
    assert_equal = data_loader.get_data(filename)
  end

  def test_it_loads_data_into_table
  end
end
